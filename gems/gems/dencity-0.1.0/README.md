# Dencity Gem

This gem is an API client for DEnCity.org.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dencity'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dencity

## Usage


### Connect to DEnCity

Without authentication:

```ruby
dencity_client = Dencity.connect
```

On a different host (for development purposes):

```ruby
dencity_client = Dencity.connect({host_name: <host_name>})
```

With authentication:
```ruby
dencity_client = Dencity.connect({username: <username>, password: <password>})
```

To authenticate an existing connection:
```ruby
dencity_client.login(<username>, <password>)
```

To authenticate using stored credentials in ~/.dencity/config.yml, call the login method without arguments. The gem will generate the config.yml for you to fill out.
```ruby
dencity_client.login
```

### Search
The search method accepts 3 optional parameters: *filters*, *return_only*, and *page*. *filters* is used to narrow the search results.  The format is an array of hashes containing 3 keys: name, value, and operator. The list of operators is as follows:
- =  -  *Equal to* operator accepts string or number values.
- ne -  *Not equal to* operator accepts string or number values.
- lt -  *Less than* operator accepts number values.
- lte - *Less than or equal to* operator accepts number values.
- gt - *Greater than* operator accepts number values.
- gte - *Greater than or equal to* operator accepts number values.
- exists - *Exists* operator is used to return structure records where the specified metadatum exists in the structure record metadata. The value key can be left blank or nil for this operator.
- in - *In* operator accepts an array of values (strings or numbers).
- nin - * Not in* operator accepts an array of values (strings or numbers).

If *filters* is nil, all results will be returned.

The *return_only* parameter limits the data within each structure record to be returned.  All fields specified in the filters will be returned as well as the fields listed in the *return_only* array.  If *return_only* is nil, all fields will be returned.

Since only 100 results are return per call, the *page* parameter allows you to step through the result set.  With each search call, the total number of results as well as total number of pages are returned.  You can use that information to make additional calls. The *page* parameter is 0-based:  set ```page=0``` to retrieve the first page of results.  If *page* is nil, the first page of results will be returned by default.

Example:
```ruby
filters = []
filters << { name: 'building_area', value: 2800, operator: 'lt' }
filters << { name: 'building_type', value: ['Community Center'], operator: 'in' }
return_only = ['related_files']
page = 3
results = dencity_client.search(filters, return_only, page)
```

### Retrieve an Analysis
There are two methods of retrieving an analysis:  by ID, or by name + userID.

Retrieve an analysis by ID:
```ruby
analysis = dencity_client.retrieve_analysis_by_id(<id>)
```
Retrieve by analysis name and userID:
```ruby
analysis = dencity_client.retrieve_analysis_by_name(<analysis_name>, <user_id>)
```
You have access to your own user_id from the response object returned once you login to DEnCity, or from your account page on DEnCity.org.

### Upload an Analysis
First load an analysis from a json file, then upload to DEnCity.org.
```ruby
analysis = dencity_client.load_analysis(<json_file_path>)
analysis_response = analysis.push
```
To catch the response and ensure that the analysis was uploaded to DEnCity.org correctly, you may want to use a begin-end block:
```ruby
analysis = dencity_client.load_analysis(<json_file_path>)
begin
  analysis_response = analysis.push
rescue StandardError => e
  printf "%-40s %s\n", 'Upload Analysis', 'FAIL'
  puts e
else
  printf "%-40s %s\n", 'Upload Analysis', 'SUCCESS'
  puts analysis_response
end
```
When uploading an analysis, the combination of user_id and user_defined_id will be checked.
If an analysis with the same user_id and user_defined_id already exists on DEnCity.org, it will be updated; otherwise, a new analysis will be created.

### Upload a Structure
To upload a structure, you will need an analysis_id.  You can also specify a user_defined_id to identify your structure for future retrieving.
```ruby
structure = dencity_client.load_structure(<analysis_id>, <user_defined_id> <json_file_path>)
structure_response = structure.push
```
When uploading a structure, the combination of user_id and user_defined_id will be checked.
If a structure with the same user_id and user_defined_id already exists on DEnCity.org, it will be updated; otherwise, a new structure will be created.

### Bulk Structures Upload
Each time a structure is loaded, it is appended to the structures array defined on the Dencity Client: ```dencity_client.structures```.  You can bulk upload all structures to DenCity.org:
```ruby
dencity_client.bulk_upload_structures
```

### Upload a file
Files can be attached to an uploaded structure.  You will need to pass in the filepath as well as the desired filename on DEnCity.org.  If no filename is specified, the file's current name will be used.

```ruby
 response = structure.upload_file(<file_path>, <file_name>)
```

### Delete an uploaded file
Uploaded files can also be deleted from DEncity.org:
```ruby
 response = structure.delete_file(<file_name>)
 ```

### Additional Examples

You can also do simple GETs using the dencity_get method.

Get all analyses:
```ruby
response = dencity_client.dencity_get('analyses')
```
Get structure by ID:
```ruby
response = dencity_client.dencity_get('structures/<structure_id>')
```

The file example_script.rb contains many usage examples.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

