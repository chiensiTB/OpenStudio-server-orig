
# open the class to add methods to return sizing values
class OpenStudio::Model::FanOnOff
  include PrototypeFan

  # Sets the fan pressure rise based on the Prototype buildings inputs
  # which are governed by the flow rate coming through the fan
  # and whether the fan lives inside a unit heater, PTAC, etc.
  def apply_prototype_fan_pressure_rise(building_type, template, climate_zone)
    # Get the max flow rate from the fan.
    maximum_flow_rate_m3_per_s = nil
    if maximumFlowRate.is_initialized
      maximum_flow_rate_m3_per_s = maximumFlowRate.get
    elsif autosizedMaximumFlowRate.is_initialized
      maximum_flow_rate_m3_per_s = autosizedMaximumFlowRate.get
    else
      OpenStudio.logFree(OpenStudio::Warn, 'openstudio.prototype.FanOnOff', "For #{name} max flow rate is not available, cannot apply prototype assumptions.")
      return false
    end

    # Convert max flow rate to cfm
    maximum_flow_rate_cfm = OpenStudio.convert(maximum_flow_rate_m3_per_s, 'm^3/s', 'cfm').get

    # Pressure rise will be determined based on the
    # following logic.
    pressure_rise_in_h2o = 0.0

    # If the fan lives inside of a zone hvac equipment
    if containingZoneHVACComponent.is_initialized
      zone_hvac = containingZoneHVACComponent.get
      if zone_hvac.to_ZoneHVACPackagedTerminalAirConditioner.is_initialized
        pressure_rise_in_h2o = 1.33
      elsif zone_hvac.to_ZoneHVACFourPipeFanCoil.is_initialized
        pressure_rise_in_h2o = 1.087563267
      elsif zone_hvac.to_ZoneHVACUnitHeater.is_initialized
        pressure_rise_in_h2o = 0.2
      else # This type of fan should not exist in the prototype models
        return false
      end
    end

    # If the fan lives on an airloop
    if airLoopHVAC.is_initialized
      case template
      when 'DOE Ref Pre-1980', 'DOE Ref 1980-2004', '90.1-2004'
        pressure_rise_in_h2o = if maximum_flow_rate_cfm < 7437
                                 2.5
                               elsif maximum_flow_rate_cfm >= 7437 && maximum_flow_rate_cfm < 20_000
                                 4.46
                               else # Over 20,000 cfm
                                 4.09
                               end
      when '90.1-2007', '90.1-2010', '90.1-2013'
        pressure_rise_in_h2o = if maximum_flow_rate_cfm < 7437
                                 2.5
                               else # Over 7,437 cfm
                                 4.09
                               end
      end
    end

    # If the fan lives inside a unitary system
    if airLoopHVAC.empty? && containingZoneHVACComponent.empty?
      case template
      when 'DOE Ref Pre-1980', 'DOE Ref 1980-2004', '90.1-2004'
        pressure_rise_in_h2o = if maximum_flow_rate_cfm < 7437
                                 2.5
                               elsif maximum_flow_rate_cfm >= 7437 && maximum_flow_rate_cfm < 20_000
                                 4.46
                               else # Over 20,000 cfm
                                 4.09
                               end
      when '90.1-2007', '90.1-2010', '90.1-2013'
        pressure_rise_in_h2o = if maximum_flow_rate_cfm < 7437
                                 2.5
                               else # Over 7,437 cfm
                                 4.09
                               end
      end
    end

    # Set the fan pressure rise
    pressure_rise_pa = OpenStudio.convert(pressure_rise_in_h2o, 'inH_{2}O', 'Pa').get
    setPressureRise(pressure_rise_pa)

    OpenStudio.logFree(OpenStudio::Info, 'openstudio.prototype.FanOnOff', "For Prototype: #{name}: #{maximum_flow_rate_cfm.round}cfm; Pressure Rise = #{pressure_rise_in_h2o}in w.c.")

    return true
  end
end
