
# Modules for building-type specific methods
module PrototypeBuilding
module FullServiceRestaurant
  def self.define_space_type_map(building_type, template, climate_zone)
    space_type_map = nil
    case template
    when 'DOE Ref Pre-1980'
      space_type_map = {
        'Dining' => ['Dining'],
        'Kitchen' => ['Kitchen']
      }
    when 'DOE Ref 1980-2004', '90.1-2010', '90.1-2007', '90.1-2004', '90.1-2013'
      space_type_map = {
        'Dining' => ['Dining'],
        'Kitchen' => ['Kitchen'],
        'Attic' => ['attic']
      }

    when 'NECB 2011'
      space_type_map = {
        '- undefined -' => ['attic'],
        'Dining - family space' => ['Dining'],
        'Food preparation' => ['Kitchen']
      }
    end

    return space_type_map
  end

  def self.define_hvac_system_map(building_type, template, climate_zone)
    case template
    when 'DOE Ref Pre-1980', 'DOE Ref 1980-2004'
      system_to_space_map = [
        {
          'type' => 'PSZ-AC',
          'space_names' => ['Dining', 'Kitchen']
        },
        {
          'type' => 'Exhaust Fan',
          'name' => 'Dining Exhaust Fan',
          'availability_sch_name' => 'RestaurantSitDown HVACOperationSchd',
          'flow_rate' => 1.828,
          'flow_fraction_schedule_name' => nil,
          'balanced_exhaust_fraction_schedule_name' => nil,
          'space_names' =>
            [
              'Dining'
            ]
        },
        {
          'type' => 'Exhaust Fan',
          'name' => 'Kitchen Exhaust Fan',
          'availability_sch_name' => 'RestaurantSitDown HVACOperationSchd',
          'flow_rate' => 0.06,
          'flow_fraction_schedule_name' => nil,
          'balanced_exhaust_fraction_schedule_name' => nil,
          'space_names' =>
            [
              'Kitchen'
            ]
        },
        {
          'type' => 'Refrigeration',
          'case_type' => 'Walkin Freezer',
          'cooling_capacity_per_length' => 688,
          'length' => 2.44,
          'evaporator_fan_pwr_per_length' => 74,
          'lighting_per_length' => 33,
          'lighting_sch_name' => 'FullServiceRestaurant Bldg Light',
          'defrost_pwr_per_length' => 820,
          'restocking_sch_name' => 'RestaurantSitDown Kitchen_Case:1_WALKINFREEZER_WalkInStockingSched',
          'cop' => 1.5,
          'cop_f_of_t_curve_name' => 'RACK1_RackCOPfTCurve',
          'condenser_fan_pwr' => 330,
          'condenser_fan_pwr_curve_name' => 'RACK1_RackCondFanCurve2',
          'space_names' =>
            [
              'Kitchen'
            ]
        },
        {
          'type' => 'Refrigeration',
          'case_type' => 'Display Case',
          'cooling_capacity_per_length' => 734.0,
          'length' => 3.05,
          'evaporator_fan_pwr_per_length' => 66,
          'lighting_per_length' => 33.0,
          'lighting_sch_name' => 'FullServiceRestaurant Bldg Light',
          'defrost_pwr_per_length' => 0.0,
          'restocking_sch_name' => 'RestaurantSitDown Kitchen_Case:2_SELFCONTAINEDDISPLAYCASE_CaseStockingSched',
          'cop' => 3.0,
          'cop_f_of_t_curve_name' => 'RACK2_RackCOPfTCurve',
          'condenser_fan_pwr' => 330,
          'condenser_fan_pwr_curve_name' => nil,
          'space_names' =>
            [
              'Kitchen'
            ]
        }
      ]
    when '90.1-2004'
      system_to_space_map = [
        {
          'type' => 'PSZ-AC',
          'space_names' => ['Dining', 'Kitchen']
        },
        {
          'type' => 'Exhaust Fan',
          'name' => 'Dining Exhaust Fan',
          'availability_sch_name' => 'RestaurantSitDown HVACOperationSchd',
          'flow_rate' => 2.644,
          'flow_fraction_schedule_name' => nil,
          'balanced_exhaust_fraction_schedule_name' => nil,
          'space_names' =>
            [
              'Dining'
            ]
        },
        {
          'type' => 'Exhaust Fan',
          'name' => 'Kitchen Exhaust Fan',
          'availability_sch_name' => 'RestaurantSitDown HVACOperationSchd',
          'flow_rate' => 2.83169,
          'flow_fraction_schedule_name' => nil,
          'balanced_exhaust_fraction_schedule_name' => nil,
          'space_names' =>
            [
              'Kitchen'
            ]
        },
        {
          'type' => 'Refrigeration',
          'case_type' => 'Walkin Freezer',
          'cooling_capacity_per_length' => 688,
          'length' => 2.44,
          'evaporator_fan_pwr_per_length' => 74,
          'lighting_per_length' => 33,
          'lighting_sch_name' => 'RestaurantSitDown BLDG_LIGHT_KITCHEN_SCH_2004_2007',
          'defrost_pwr_per_length' => 820,
          'restocking_sch_name' => 'RestaurantSitDown Kitchen_Case:1_WALKINFREEZER_WalkInStockingSched',
          'cop' => 1.5,
          'cop_f_of_t_curve_name' => 'RACK1_RackCOPfTCurve',
          'condenser_fan_pwr' => 330,
          'condenser_fan_pwr_curve_name' => 'RACK1_RackCondFanCurve2',
          'space_names' =>
            [
              'Kitchen'
            ]
        },
        {
          'type' => 'Refrigeration',
          'case_type' => 'Display Case',
          'cooling_capacity_per_length' => 734.0,
          'length' => 3.05,
          'evaporator_fan_pwr_per_length' => 66,
          'lighting_per_length' => 33.0,
          'lighting_sch_name' => 'RestaurantSitDown BLDG_LIGHT_KITCHEN_SCH_2004_2007',
          'defrost_pwr_per_length' => 0.0,
          'restocking_sch_name' => 'RestaurantSitDown Kitchen_Case:2_SELFCONTAINEDDISPLAYCASE_CaseStockingSched',
          'cop' => 3.0,
          'cop_f_of_t_curve_name' => 'RACK2_RackCOPfTCurve',
          'condenser_fan_pwr' => 330,
          'condenser_fan_pwr_curve_name' => nil,
          'space_names' =>
            [
              'Kitchen'
            ]
        }
      ]
    when '90.1-2007'
      system_to_space_map = [
        {
          'type' => 'PSZ-AC',
          'space_names' => ['Dining', 'Kitchen']
        },
        {
          'type' => 'Exhaust Fan',
          'name' => 'Dining Exhaust Fan',
          'availability_sch_name' => 'RestaurantSitDown HVACOperationSchd',
          'flow_rate' => 1.331432,
          'flow_fraction_schedule_name' => nil,
          'balanced_exhaust_fraction_schedule_name' => nil,
          'space_names' =>
            [
              'Dining'
            ]
        },
        {
          'type' => 'Exhaust Fan',
          'name' => 'Kitchen Exhaust Fan',
          'availability_sch_name' => 'RestaurantSitDown HVACOperationSchd',
          'flow_rate' => 2.83169,
          'flow_fraction_schedule_name' => nil,
          'balanced_exhaust_fraction_schedule_name' => nil,
          'space_names' =>
            [
              'Kitchen'
            ]
        },
        {
          'type' => 'Refrigeration',
          'case_type' => 'Walkin Freezer',
          'cooling_capacity_per_length' => 688,
          'length' => 2.44,
          'evaporator_fan_pwr_per_length' => 74,
          'lighting_per_length' => 33,
          'lighting_sch_name' => 'RestaurantSitDown BLDG_LIGHT_KITCHEN_SCH_2004_2007',
          'defrost_pwr_per_length' => 820,
          'restocking_sch_name' => 'RestaurantSitDown Kitchen_Case:1_WALKINFREEZER_WalkInStockingSched',
          'cop' => 1.5,
          'cop_f_of_t_curve_name' => 'RACK1_RackCOPfTCurve',
          'condenser_fan_pwr' => 330,
          'condenser_fan_pwr_curve_name' => 'RACK1_RackCondFanCurve2',
          'space_names' =>
            [
              'Kitchen'
            ]
        },
        {
          'type' => 'Refrigeration',
          'case_type' => 'Display Case',
          'cooling_capacity_per_length' => 734.0,
          'length' => 3.05,
          'evaporator_fan_pwr_per_length' => 66,
          'lighting_per_length' => 33.0,
          'lighting_sch_name' => 'RestaurantSitDown BLDG_LIGHT_KITCHEN_SCH_2004_2007',
          'defrost_pwr_per_length' => 0.0,
          'restocking_sch_name' => 'RestaurantSitDown Kitchen_Case:2_SELFCONTAINEDDISPLAYCASE_CaseStockingSched',
          'cop' => 3.0,
          'cop_f_of_t_curve_name' => 'RACK2_RackCOPfTCurve',
          'condenser_fan_pwr' => 330,
          'condenser_fan_pwr_curve_name' => nil,
          'space_names' =>
            [
              'Kitchen'
            ]
        }
      ]
    when '90.1-2007'
      system_to_space_map = [
        {
          'type' => 'PSZ-AC',
          'space_names' => ['Dining', 'Kitchen']
        },
        {
          'type' => 'Exhaust Fan',
          'name' => 'Dining Exhaust Fan',
          'availability_sch_name' => 'RestaurantSitDown HVACOperationSchd',
          'flow_rate' => 1.331432,
          'flow_fraction_schedule_name' => nil,
          'balanced_exhaust_fraction_schedule_name' => nil,
          'space_names' =>
            [
              'Dining'
            ]
        },
        {
          'type' => 'Exhaust Fan',
          'name' => 'Kitchen Exhaust Fan',
          'availability_sch_name' => 'RestaurantSitDown HVACOperationSchd',
          'flow_rate' => 2.83169,
          'flow_fraction_schedule_name' => nil,
          'balanced_exhaust_fraction_schedule_name' => nil,
          'space_names' =>
            [
              'Kitchen'
            ]
        },
        {
          'type' => 'Refrigeration',
          'case_type' => 'Walkin Freezer',
          'cooling_capacity_per_length' => 688,
          'length' => 2.44,
          'evaporator_fan_pwr_per_length' => 74,
          'lighting_per_length' => 33,
          'lighting_sch_name' => 'RestaurantSitDown BLDG_LIGHT_KITCHEN_SCH_2004_2007',
          'defrost_pwr_per_length' => 820,
          'restocking_sch_name' => 'RestaurantSitDown Kitchen_Case:1_WALKINFREEZER_WalkInStockingSched',
          'cop' => 1.5,
          'cop_f_of_t_curve_name' => 'RACK1_RackCOPfTCurve',
          'condenser_fan_pwr' => 330,
          'condenser_fan_pwr_curve_name' => 'RACK1_RackCondFanCurve2',
          'space_names' =>
            [
              'Kitchen'
            ]
        },
        {
          'type' => 'Refrigeration',
          'case_type' => 'Display Case',
          'cooling_capacity_per_length' => 734.0,
          'length' => 3.05,
          'evaporator_fan_pwr_per_length' => 66,
          'lighting_per_length' => 33.0,
          'lighting_sch_name' => 'RestaurantSitDown BLDG_LIGHT_KITCHEN_SCH_2004_2007',
          'defrost_pwr_per_length' => 0.0,
          'restocking_sch_name' => 'RestaurantSitDown Kitchen_Case:2_SELFCONTAINEDDISPLAYCASE_CaseStockingSched',
          'cop' => 3.0,
          'cop_f_of_t_curve_name' => 'RACK2_RackCOPfTCurve',
          'condenser_fan_pwr' => 330,
          'condenser_fan_pwr_curve_name' => nil,
          'space_names' =>
            [
              'Kitchen'
            ]
        }
      ]
    when '90.1-2010'
      system_to_space_map = [
        {
          'type' => 'PSZ-AC',
          'space_names' => ['Dining', 'Kitchen']
        },
        {
          'type' => 'Exhaust Fan',
          'name' => 'Dining Exhaust Fan',
          'availability_sch_name' => 'RestaurantSitDown HVACOperationSchd',
          'flow_rate' => 1.331432,
          'flow_fraction_schedule_name' => nil,
          'balanced_exhaust_fraction_schedule_name' => nil,
          'space_names' =>
            [
              'Dining'
            ]
        },
        {
          'type' => 'Exhaust Fan',
          'name' => 'Kitchen Exhaust Fan',
          'availability_sch_name' => 'RestaurantSitDown HVACOperationSchd',
          'flow_rate' => 2.548516,
          'flow_fraction_schedule_name' => nil,
          'balanced_exhaust_fraction_schedule_name' => nil,
          'space_names' =>
            [
              'Kitchen'
            ]
        },
        {
          'type' => 'Refrigeration',
          'case_type' => 'Walkin Freezer',
          'cooling_capacity_per_length' => 688,
          'length' => 2.44,
          'evaporator_fan_pwr_per_length' => 74,
          'lighting_per_length' => 33,
          'lighting_sch_name' => 'RestaurantSitDown BLDG_LIGHT_KITCHEN_SCH_2004_2007',
          'defrost_pwr_per_length' => 820,
          'restocking_sch_name' => 'RestaurantSitDown Kitchen_Case:1_WALKINFREEZER_WalkInStockingSched',
          'cop' => 1.5,
          'cop_f_of_t_curve_name' => 'RACK1_RackCOPfTCurve',
          'condenser_fan_pwr' => 330,
          'condenser_fan_pwr_curve_name' => 'RACK1_RackCondFanCurve2',
          'space_names' =>
            [
              'Kitchen'
            ]
        },
        {
          'type' => 'Refrigeration',
          'case_type' => 'Display Case',
          'cooling_capacity_per_length' => 734.0,
          'length' => 3.05,
          'evaporator_fan_pwr_per_length' => 66,
          'lighting_per_length' => 33.0,
          'lighting_sch_name' => 'RestaurantSitDown BLDG_LIGHT_KITCHEN_SCH_2004_2007',
          'defrost_pwr_per_length' => 0.0,
          'restocking_sch_name' => 'RestaurantSitDown Kitchen_Case:2_SELFCONTAINEDDISPLAYCASE_CaseStockingSched',
          'cop' => 3.0,
          'cop_f_of_t_curve_name' => 'RACK2_RackCOPfTCurve',
          'condenser_fan_pwr' => 330,
          'condenser_fan_pwr_curve_name' => nil,
          'space_names' =>
            [
              'Kitchen'
            ]
        }
      ]
    when '90.1-2013'
      system_to_space_map = [
        {
          'type' => 'PSZ-AC',
          'space_names' => ['Dining', 'Kitchen']
        },
        {
          'type' => 'Exhaust Fan',
          'name' => 'Dining Exhaust Fan',
          'availability_sch_name' => 'RestaurantSitDown HVACOperationSchd',
          'flow_rate' => 1.331432,
          'flow_fraction_schedule_name' => nil,
          'balanced_exhaust_fraction_schedule_name' => nil,
          'space_names' =>
            [
              'Dining'
            ]
        },
        {
          'type' => 'Exhaust Fan',
          'name' => 'Kitchen Exhaust Fan',
          'availability_sch_name' => 'RestaurantSitDown HVACOperationSchd',
          'flow_rate' => 2.548516,
          'flow_fraction_schedule_name' => nil,
          'balanced_exhaust_fraction_schedule_name' => nil,
          'space_names' =>
            [
              'Kitchen'
            ]
        },
        {
          'type' => 'Refrigeration',
          'case_type' => 'Walkin Freezer',
          'cooling_capacity_per_length' => 688,
          'length' => 2.44,
          'evaporator_fan_pwr_per_length' => 21.14286,
          'lighting_per_length' => 33,
          'lighting_sch_name' => 'RestaurantSitDown walkin_occ_lght_SCH',
          'defrost_pwr_per_length' => 820,
          'restocking_sch_name' => 'RestaurantSitDown Kitchen_Case:1_WALKINFREEZER_WalkInStockingSched',
          'cop' => 1.5,
          'cop_f_of_t_curve_name' => 'RACK1_RackCOPfTCurve',
          'condenser_fan_pwr' => 330,
          'condenser_fan_pwr_curve_name' => 'RACK1_RackCondFanCurve2',
          'space_names' =>
            [
              'Kitchen'
            ]
        },
        {
          'type' => 'Refrigeration',
          'case_type' => 'Display Case',
          'cooling_capacity_per_length' => 734.0,
          'length' => 3.05,
          'evaporator_fan_pwr_per_length' => 18.85714,
          'lighting_per_length' => 33.0,
          'lighting_sch_name' => 'RestaurantSitDown walkin_occ_lght_SCH',
          'defrost_pwr_per_length' => 0.0,
          'restocking_sch_name' => 'RestaurantSitDown Kitchen_Case:2_SELFCONTAINEDDISPLAYCASE_CaseStockingSched',
          'cop' => 3.0,
          'cop_f_of_t_curve_name' => 'RACK2_RackCOPfTCurve',
          'condenser_fan_pwr' => 330,
          'condenser_fan_pwr_curve_name' => nil,
          'space_names' =>
            [
              'Kitchen'
            ]
        }
      ]

    end

    return system_to_space_map
  end

  def self.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    OpenStudio.logFree(OpenStudio::Info, 'openstudio.model.Model', 'Started building type specific adjustments')

    # add extra equipment for kitchen
    PrototypeBuilding::FullServiceRestaurant.add_extra_equip_kitchen(template, model)
    # add extra infiltration for dining room door and attic
    PrototypeBuilding::FullServiceRestaurant.add_door_infiltration(template, climate_zone, model)
    # add zone_mixing between kitchen and dining
    PrototypeBuilding::FullServiceRestaurant.add_zone_mixing(template, model)
    # Update Sizing Zone
    PrototypeBuilding::FullServiceRestaurant.update_sizing_zone(template, model)
    # adjust the cooling setpoint
    PrototypeBuilding::FullServiceRestaurant.adjust_clg_setpoint(template, climate_zone, model)
    # reset the design OA of kitchen
    PrototypeBuilding::FullServiceRestaurant.reset_kitchen_oa(template, model)

    OpenStudio.logFree(OpenStudio::Info, 'openstudio.model.Model', 'Finished building type specific adjustments')

    return true
  end # add hvac

  def self.add_door_infiltration(template, climate_zone, model)
    # add extra infiltration for dining room door and attic (there is no attic in 'DOE Ref Pre-1980')
    unless template == 'DOE Ref 1980-2004' || template == 'DOE Ref Pre-1980' || template == 'NECB 2011'
      dining_space = model.getSpaceByName('Dining').get
      attic_space = model.getSpaceByName('Attic').get
      infiltration_diningdoor = OpenStudio::Model::SpaceInfiltrationDesignFlowRate.new(model)
      infiltration_attic = OpenStudio::Model::SpaceInfiltrationDesignFlowRate.new(model)
      infiltration_diningdoor.setName('Dining door Infiltration')
      infiltration_per_zone_diningdoor = 0
      infiltration_per_zone_attic = 0.2378
      if template == '90.1-2004'
        infiltration_per_zone_diningdoor = 0.614474994
        infiltration_diningdoor.setSchedule(model.add_schedule('RestaurantSitDown DOOR_INFIL_SCH'))
      elsif template == '90.1-2007'
        case climate_zone
        when 'ASHRAE 169-2006-1A', 'ASHRAE 169-2006-2A', 'ASHRAE 169-2006-2B', 'ASHRAE 169-2006-3A', 'ASHRAE 169-2006-3B',
            'ASHRAE 169-2006-3C', 'ASHRAE 169-2006-4A', 'ASHRAE 169-2006-4B', 'ASHRAE 169-2006-4C'
          infiltration_per_zone_diningdoor = 0.614474994
          infiltration_diningdoor.setSchedule(model.add_schedule('RestaurantSitDown DOOR_INFIL_SCH'))
        else
          infiltration_per_zone_diningdoor = 0.389828222
          infiltration_diningdoor.setSchedule(model.add_schedule('RestaurantSitDown VESTIBULE_DOOR_INFIL_SCH'))
        end
      elsif template == '90.1-2010' || template == '90.1-2013'
        case climate_zone
        when 'ASHRAE 169-2006-1A', 'ASHRAE 169-2006-2A', 'ASHRAE 169-2006-2B', 'ASHRAE 169-2006-3A', 'ASHRAE 169-2006-3B', 'ASHRAE 169-2006-3C'
          infiltration_per_zone_diningdoor = 0.614474994
          infiltration_diningdoor.setSchedule(model.add_schedule('RestaurantSitDown DOOR_INFIL_SCH'))
        else
          infiltration_per_zone_diningdoor = 0.389828222
          infiltration_diningdoor.setSchedule(model.add_schedule('RestaurantSitDown VESTIBULE_DOOR_INFIL_SCH'))
        end
      end
      infiltration_diningdoor.setDesignFlowRate(infiltration_per_zone_diningdoor)
      infiltration_diningdoor.setSpace(dining_space)
      infiltration_attic.setDesignFlowRate(infiltration_per_zone_attic)
      infiltration_attic.setSchedule(model.add_schedule('Always On'))
      infiltration_attic.setSpace(attic_space)
    end
  end

  def self.update_exhaust_fan_efficiency(template, model)
    case template
    when '90.1-2004', '90.1-2007', '90.1-2010', '90.1-2013'
      model.getFanZoneExhausts.sort.each do |exhaust_fan|
        fan_name = exhaust_fan.name.to_s
        if fan_name.include? 'Dining'
          exhaust_fan.setFanEfficiency(1)
          exhaust_fan.setPressureRise(0)
        end
      end
    when 'DOE Ref Pre-1980', 'DOE Ref 1980-2004'
      model.getFanZoneExhausts.sort.each do |exhaust_fan|
        exhaust_fan.setFanEfficiency(1)
        exhaust_fan.setPressureRise(0.000001)
      end
    end
  end

  def self.add_zone_mixing(template, model)
    # add zone_mixing between kitchen and dining
    space_kitchen = model.getSpaceByName('Kitchen').get
    zone_kitchen = space_kitchen.thermalZone.get
    space_dining = model.getSpaceByName('Dining').get
    zone_dining = space_dining.thermalZone.get
    zone_mixing_kitchen = OpenStudio::Model::ZoneMixing.new(zone_kitchen)
    zone_mixing_kitchen.setSchedule(model.add_schedule('RestaurantSitDown Hours_of_operation'))
    case template
    when 'DOE Ref Pre-1980', 'DOE Ref 1980-2004'
      zone_mixing_kitchen.setDesignFlowRate(1.828)
    when '90.1-2007', '90.1-2010', '90.1-2013'
      zone_mixing_kitchen.setDesignFlowRate(1.33143208)
    when '90.1-2004'
      zone_mixing_kitchen.setDesignFlowRate(2.64397817)
    end
    zone_mixing_kitchen.setSourceZone(zone_dining)
    zone_mixing_kitchen.setDeltaTemperature(0)
  end

  # add extra equipment for kitchen
  def self.add_extra_equip_kitchen(template, model)
    kitchen_space = model.getSpaceByName('Kitchen')
    kitchen_space = kitchen_space.get
    kitchen_space_type = kitchen_space.spaceType.get
    elec_equip_def1 = OpenStudio::Model::ElectricEquipmentDefinition.new(model)
    elec_equip_def2 = OpenStudio::Model::ElectricEquipmentDefinition.new(model)
    elec_equip_def1.setName('Kitchen Electric Equipment Definition1')
    elec_equip_def2.setName('Kitchen Electric Equipment Definition2')
    case template
    when '90.1-2004', '90.1-2007', '90.1-2010', '90.1-2013'
      elec_equip_def1.setFractionLatent(0)
      elec_equip_def1.setFractionRadiant(0.25)
      elec_equip_def1.setFractionLost(0)
      elec_equip_def2.setFractionLatent(0)
      elec_equip_def2.setFractionRadiant(0.25)
      elec_equip_def2.setFractionLost(0)
      if template == '90.1-2013'
        elec_equip_def1.setDesignLevel(457.5)
        elec_equip_def2.setDesignLevel(570)
      else
        elec_equip_def1.setDesignLevel(515.917)
        elec_equip_def2.setDesignLevel(851.67)
      end
      # Create the electric equipment instance and hook it up to the space type
      elec_equip1 = OpenStudio::Model::ElectricEquipment.new(elec_equip_def1)
      elec_equip2 = OpenStudio::Model::ElectricEquipment.new(elec_equip_def2)
      elec_equip1.setName('Kitchen_Reach-in-Freezer')
      elec_equip2.setName('Kitchen_Reach-in-Refrigerator')
      elec_equip1.setSpaceType(kitchen_space_type)
      elec_equip2.setSpaceType(kitchen_space_type)
      elec_equip1.setSchedule(model.add_schedule('RestaurantSitDown ALWAYS_ON'))
      elec_equip2.setSchedule(model.add_schedule('RestaurantSitDown ALWAYS_ON'))
    when 'DOE Ref Pre-1980', 'DOE Ref 1980-2004'
      elec_equip_def1.setDesignLevel(699)
      elec_equip_def1.setFractionLatent(0)
      elec_equip_def1.setFractionRadiant(0)
      elec_equip_def1.setFractionLost(1)
      # Create the electric equipment instance and hook it up to the space type
      elec_equip1 = OpenStudio::Model::ElectricEquipment.new(elec_equip_def1)
      elec_equip1.setName('Kitchen_ExhFan_Equip')
      elec_equip1.setSpaceType(kitchen_space_type)
      elec_equip1.setSchedule(model.add_schedule('RestaurantSitDown Kitchen_Exhaust_SCH'))
    end
  end

  def self.update_sizing_zone(template, model)
    case template
    when '90.1-2007', '90.1-2010', '90.1-2013'
      zone_sizing = model.getSpaceByName('Dining').get.thermalZone.get.sizingZone
      zone_sizing.setCoolingDesignAirFlowMethod('DesignDayWithLimit')
      zone_sizing.setCoolingMinimumAirFlowperZoneFloorArea(0.003581176)
      zone_sizing = model.getSpaceByName('Kitchen').get.thermalZone.get.sizingZone
      zone_sizing.setCoolingDesignAirFlowMethod('DesignDayWithLimit')
      zone_sizing.setCoolingMinimumAirFlowperZoneFloorArea(0)
    when '90.1-2004'
      zone_sizing = model.getSpaceByName('Dining').get.thermalZone.get.sizingZone
      zone_sizing.setCoolingDesignAirFlowMethod('DesignDayWithLimit')
      zone_sizing.setCoolingMinimumAirFlowperZoneFloorArea(0.007111554)
      zone_sizing = model.getSpaceByName('Kitchen').get.thermalZone.get.sizingZone
      zone_sizing.setCoolingDesignAirFlowMethod('DesignDayWithLimit')
      zone_sizing.setCoolingMinimumAirFlowperZoneFloorArea(0)
    end
  end

  def self.adjust_clg_setpoint(template, climate_zone, model)
    ['Dining', 'Kitchen'].each do |space_name|
      space_type_name = model.getSpaceByName(space_name).get.spaceType.get.name.get
      thermostat_name = space_type_name + ' Thermostat'
      thermostat = model.getThermostatSetpointDualSetpointByName(thermostat_name).get
      case template
      when '90.1-2004', '90.1-2007', '90.1-2010'
        if climate_zone == 'ASHRAE 169-2006-2B' || climate_zone == 'ASHRAE 169-2006-1B' || climate_zone == 'ASHRAE 169-2006-3B'
          case space_name
          when 'Dining'
            thermostat.setCoolingSetpointTemperatureSchedule(model.add_schedule('RestaurantSitDown CLGSETP_SCH_NO_OPTIMUM'))
          when 'Kitchen'
            thermostat.setCoolingSetpointTemperatureSchedule(model.add_schedule('RestaurantSitDown CLGSETP_KITCHEN_SCH_NO_OPTIMUM'))
          end
        end
      end
    end
  end

  # In order to provide sufficient OSA to replace exhaust flow through kitchen hoods (3,300 cfm),
  # modeled OSA to kitchen is different from OSA determined based on ASHRAE  62.1.
  # It takes into account the available OSA in dining as transfer air.
  def self.reset_kitchen_oa(template, model)
    space_kitchen = model.getSpaceByName('Kitchen').get
    ventilation = space_kitchen.designSpecificationOutdoorAir.get
    ventilation.setOutdoorAirFlowperPerson(0)
    ventilation.setOutdoorAirFlowperFloorArea(0)
    case template
    when '90.1-2010', '90.1-2013'
      ventilation.setOutdoorAirFlowRate(1.21708392)
    when '90.1-2007'
      ventilation.setOutdoorAirFlowRate(1.50025792)
    when '90.1-2004'
      ventilation.setOutdoorAirFlowRate(1.87711831)
    end
  end

  def self.update_waterheater_loss_coefficient(template, model)
    case template
    when '90.1-2004', '90.1-2007', '90.1-2010', '90.1-2013', 'NECB 2011'
      model.getWaterHeaterMixeds.sort.each do |water_heater|
        if water_heater.name.to_s.include?('Booster')
          water_heater.setOffCycleLossCoefficienttoAmbientTemperature(1.053159296)
          water_heater.setOnCycleLossCoefficienttoAmbientTemperature(1.053159296)
        else
          water_heater.setOffCycleLossCoefficienttoAmbientTemperature(9.643286505)
          water_heater.setOnCycleLossCoefficienttoAmbientTemperature(9.643286505)
        end
      end
    end
  end

  def self.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    PrototypeBuilding::FullServiceRestaurant.update_waterheater_loss_coefficient(template, model)

    return true
  end
end
end
