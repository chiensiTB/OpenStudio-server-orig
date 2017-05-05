
# open the class to add methods to apply HVAC efficiency standards
class OpenStudio::Model::AirTerminalSingleDuctParallelPIUReheat
  # Sets the fan power of a PIU fan based on the W/cfm
  # specified in the standard.
  #
  # @param template [String] the template base requirements on
  # @return [Bool] returns true if successful, false if not
  def apply_prm_baseline_fan_power(template)
    OpenStudio.logFree(OpenStudio::Debug, 'openstudio.model.AirTerminalSingleDuctParallelPIUReheat', "Setting PIU fan power for #{name}.")

    # Determine the fan sizing flow rate, min flow rate,
    # and W/cfm
    sec_flow_frac = 0.5
    min_flow_frac = 0.3
    fan_efficacy_w_per_cfm = 0.35

    # Convert efficacy to metric
    # 1 cfm = 0.0004719 m^3/s
    fan_efficacy_w_per_m3_per_s = fan_efficacy_w_per_cfm / 0.0004719

    # Get the maximum flow rate through the terminal
    max_primary_air_flow_rate = nil
    if autosizedMaximumPrimaryAirFlowRate.is_initialized
      max_primary_air_flow_rate = autosizedMaximumPrimaryAirFlowRate.get
    elsif maximumPrimaryAirFlowRate.is_initialized
      max_primary_air_flow_rate = maximumPrimaryAirFlowRate.get
    end

    # Set the max secondary air flow rate
    max_sec_flow_rate_m3_per_s = max_primary_air_flow_rate * sec_flow_frac
    setMaximumSecondaryAirFlowRate(max_sec_flow_rate_m3_per_s)
    max_sec_flow_rate_cfm = OpenStudio.convert(max_sec_flow_rate_m3_per_s, 'm^3/s', 'ft^3/min').get

    # Set the minimum flow fraction
    # TODO Also compare to min OA requirement
    setMinimumPrimaryAirFlowFraction(min_flow_frac)

    # Get the fan
    fan = self.fan.to_FanConstantVolume.get

    # Set the impeller efficiency
    fan.change_impeller_efficiency(fan.baseline_impeller_efficiency(template))

    # Set the motor efficiency, preserving the impeller efficency.
    # For terminal fans, a bhp lookup of 0.5bhp is always used because
    # they are assumed to represent a series of small fans in reality.
    fan.apply_standard_minimum_motor_efficiency(template, fan.brake_horsepower)

    # Calculate a new pressure rise to hit the target W/cfm
    fan_tot_eff = fan.fanEfficiency
    fan_rise_new_pa = fan_efficacy_w_per_m3_per_s * fan_tot_eff
    fan.setPressureRise(fan_rise_new_pa)

    # Calculate the newly set efficacy
    fan_power_new_w = fan_rise_new_pa * max_sec_flow_rate_m3_per_s / fan_tot_eff
    fan_efficacy_new_w_per_cfm = fan_power_new_w / max_sec_flow_rate_cfm
    OpenStudio.logFree(OpenStudio::Info, 'openstudio.model.AirTerminalSingleDuctParallelPIUReheat', "For #{name}: fan efficacy set to #{fan_efficacy_new_w_per_cfm.round(2)} W/cfm.")

    return true
  end
end
