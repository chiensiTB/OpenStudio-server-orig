module Dencity
  # Structure methods
  class Structure
    include Request

    attr_accessor :analysis_id
    attr_accessor :user_defined_id
    attr_accessor :structure
    attr_accessor :measure_instances

    # initialize
    def initialize(analysis_id = nil, user_defined_id = nil, path = nil, connection)
      @analysis_id = analysis_id
      @user_defined_id = user_defined_id
      @structure = Hashie::Mash.new
      @measure_instances = Hashie::Mash.new

      @connection = connection

      # initialize with json file
      unless path.nil?
        load_from_file(path)
      end

      @upload_retries = nil
    end

    def push
      begin
        @upload_retries ||= 0

        response = post('api/structure', format_structure)
        @structure.id = response['id'] if response['id']
        return response if response
      rescue StandardError => se
        # Decide if we should fail based on number of retries
        if @upload_retries < 3

          raise 'could not upload'
        else
          # or here: @upload_retries = nil
          return se
        end
      end
    rescue => e
      @upload_retries += 1
      sleep 2
      retry
    ensure
      # always do this
      # verify that this is only called if the retry is not triggered
      @upload_retries = nil
    end

    # load structure from json file into a mash
    def load_from_file(path)
      return unless File.exist?(path)
      json_data = File.read(path)
      load_raw_json(json_data)
    end

    # load structure from raw json
    def load_raw_json(json_data)
      temp = Hashie::Mash.new(MultiJson.load(json_data))
      @structure =  temp.structure ? temp.structure : Hashie::Mash.new
      @measure_instances = temp.measure_instances ? temp.measure_instances : Hashie::Mash.new
      # these could be set in the file
      @analysis_id = temp.structure.analysis_id if temp.structure.analysis_id
      @user_defined_id = temp.structure.user_defined_id if temp.structure.user_defined_id

      return true
    end

    # upload file
    def upload_file(path, file_name = nil)
      fail 'No Structure ID defined for structure. Can\'t upload file' if @structure.id.nil?

      file = File.open(path, 'rb')
      the_file = Base64.strict_encode64(file.read)
      file.close

      # file_data param
      file_data = {}
      file_data['file_name'] = file_name.nil? ? File.basename(path) : file_name
      file_data['file'] = the_file

      data = Hashie::Mash.new
      data.structure_id = @structure.id
      data.file_data = file_data

      push_file('api/related_file', MultiJson.dump(data))
    end

    # delete an uploaded file
    # if structure_id is nil, will use @structure.id
    def delete_file(file_name)
      fail 'No Structure ID defined for structure. Can\'t delete file' if @structure.id.nil?

      data = Hashie::Mash.new
      data.structure_id = @structure.id
      data.file_name = file_name

      push_file('api/remove_file', MultiJson.dump(data))
    end

    # push file w/ retry
    def push_file(path, data)
      begin
        @upload_retries ||= 0
        response = post(path, data)
        return response if response
      rescue StandardError => se
        # Decide if we should fail based on number of retries
        if @upload_retries < 3
          if path.include? 'remove'
            raise 'could not delete file'
          else
            raise 'could not upload file'
          end
        else
          return se
        end
      end
    rescue => e
      @upload_retries += 1
      sleep 2
      retry
    ensure
      # verify that this is only called if the retry is not triggered
      @upload_retries = nil
    end

    private

    # formats structure parameters for posting
    def format_structure
      # generate name/value pairs for structure metadata
      formatted_meta = []
      @structure.each do |k, v|
        formatted_meta << { name: k, value: v } unless %w(id user_defined_id analysis_id).include?(k)
      end
      new_struct = Hashie::Mash.new
      new_struct.metadata = formatted_meta

      # TODO: what if it's already in the structure hash?
      # add user_defined_id to structure
      new_struct.user_defined_id = @user_defined_id
      new_struct.analysis_id = @analysis_id

      data_hash = Hashie::Mash.new
      data_hash.structure = new_struct
      data_hash.measure_instances = @measure_instances ? @measure_instances : []

      # convert to json
      MultiJson.dump(data_hash)
    end
  end
end
