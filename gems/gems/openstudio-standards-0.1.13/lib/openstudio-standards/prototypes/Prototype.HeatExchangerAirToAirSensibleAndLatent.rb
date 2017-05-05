
# Reopen the OpenStudio class to add methods to apply standards to this object
class OpenStudio::Model::HeatExchangerAirToAirSensibleAndLatent
  def apply_prototype_nominal_electric_power
    # Get the nominal supply air flow rate
    supply_air_flow_m3_per_s = nil
    if nominalSupplyAirFlowRate.is_initialized
      supply_air_flow_m3_per_s = nominalSupplyAirFlowRate.get
    elsif autosizedNominalSupplyAirFlowRate.is_initialized
      supply_air_flow_m3_per_s = autosizedNominalSupplyAirFlowRate.get
    else
      # Get the min OA flow rate from the OA
      # system if the ERV was not on the system during sizing.
      # This prevents us from having to perform a second sizing run.
      controller_oa = nil
      oa_system = nil
      # Get the air loop
      air_loop = airLoopHVAC
      if air_loop.empty?
        OpenStudio.logFree(OpenStudio::Info, 'openstudio.prototype.HeatExchangerAirToAirSensibleAndLatent', "For #{name}, cannot get the air loop and therefore cannot get the min OA flow.")
        return false
      end
      air_loop = air_loop.get
      # Get the OA system
      if air_loop.airLoopHVACOutdoorAirSystem.is_initialized
        oa_system = air_loop.airLoopHVACOutdoorAirSystem.get
        controller_oa = oa_system.getControllerOutdoorAir
      else
        OpenStudio.logFree(OpenStudio::Info, 'openstudio.prototype.HeatExchangerAirToAirSensibleAndLatent', "For #{name}, cannot find the min OA flow because it has no OA intake.")
        return false
      end
      # Get the min OA flow rate from the OA
      if controller_oa.minimumOutdoorAirFlowRate.is_initialized
        supply_air_flow_m3_per_s = controller_oa.minimumOutdoorAirFlowRate.get
      elsif controller_oa.autosizedMinimumOutdoorAirFlowRate.is_initialized
        supply_air_flow_m3_per_s = controller_oa.autosizedMinimumOutdoorAirFlowRate.get
      else
        OpenStudio.logFree(OpenStudio::Warn, 'openstudio.prototype.HeatExchangerAirToAirSensibleAndLatent', "For #{name}, ERV minimum OA flow rate is not available, cannot apply prototype nominal power assumption.")
        return false
      end
    end

    # Convert the flow rate to cfm
    supply_air_flow_cfm = OpenStudio.convert(supply_air_flow_m3_per_s, 'm^3/s', 'cfm').get

    # Calculate the motor power for the rotatry wheel per:
    # Power (W) = (Nominal Supply Air Flow Rate (CFM) * 0.3386) + 49.5
    # power = (supply_air_flow_cfm * 0.3386) + 49.5

    # Calculate the motor power for the rotatry wheel per:
    # Power (W) = (Minimum Outdoor Air Flow Rate (m^3/s) * 212.5 / 0.5) + (Minimum Outdoor Air Flow Rate (m^3/s) * 162.5 / 0.5) + 50
    power = (supply_air_flow_m3_per_s * 212.5 / 0.5) + (supply_air_flow_m3_per_s * 0.9 * 162.5 / 0.5) + 50
    OpenStudio.logFree(OpenStudio::Info, 'openstudio.prototype.HeatExchangerAirToAirSensibleAndLatent', "For #{name}, ERV power is calculated to be #{power.round} W, based on a min OA flow of #{supply_air_flow_cfm.round} cfm.")

    # Set the power for the HX
    setNominalElectricPower(power)

    return true
  end
end
