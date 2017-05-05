
# Extend the class to add Medium Office specific stuff
class OpenStudio::Model::Model
  def define_space_type_map(building_type, template, climate_zone)
    case building_type
    when 'SecondarySchool'
      return PrototypeBuilding::SecondarySchool.define_space_type_map(building_type, template, climate_zone)
    when 'PrimarySchool'
      return PrototypeBuilding::PrimarySchool.define_space_type_map(building_type, template, climate_zone)
    when 'SmallOffice'
      return PrototypeBuilding::SmallOffice.define_space_type_map(building_type, template, climate_zone)
    when 'MediumOffice'
      return PrototypeBuilding::MediumOffice.define_space_type_map(building_type, template, climate_zone)
    when 'LargeOffice'
      return PrototypeBuilding::LargeOffice.define_space_type_map(building_type, template, climate_zone)
    when 'SmallHotel'
      return PrototypeBuilding::SmallHotel.define_space_type_map(building_type, template, climate_zone)
    when 'LargeHotel'
      return PrototypeBuilding::LargeHotel.define_space_type_map(building_type, template, climate_zone)
    when 'Warehouse'
      return PrototypeBuilding::Warehouse.define_space_type_map(building_type, template, climate_zone)
    when 'RetailStandalone'
      return PrototypeBuilding::RetailStandalone.define_space_type_map(building_type, template, climate_zone)
    when 'RetailStripmall'
      return PrototypeBuilding::RetailStripmall.define_space_type_map(building_type, template, climate_zone)
    when 'QuickServiceRestaurant'
      return PrototypeBuilding::QuickServiceRestaurant.define_space_type_map(building_type, template, climate_zone)
    when 'FullServiceRestaurant'
      return PrototypeBuilding::FullServiceRestaurant.define_space_type_map(building_type, template, climate_zone)
    when 'Hospital'
      return PrototypeBuilding::Hospital.define_space_type_map(building_type, template, climate_zone)
    when 'Outpatient'
      return PrototypeBuilding::Outpatient.define_space_type_map(building_type, template, climate_zone)
    when 'MidriseApartment'
      return PrototypeBuilding::MidriseApartment.define_space_type_map(building_type, template, climate_zone)
    when 'HighriseApartment'
      return PrototypeBuilding::HighriseApartment.define_space_type_map(building_type, template, climate_zone)
    else
      OpenStudio.logFree(OpenStudio::Error, 'openstudio.model.Model.define_space_type_map', "Building Type = #{building_type} not recognized")
      return false
    end
  end

  def define_hvac_system_map(building_type, template, climate_zone)
    case building_type
    when 'SecondarySchool'
      return PrototypeBuilding::SecondarySchool.define_hvac_system_map(building_type, template, climate_zone)
    when 'PrimarySchool'
      return PrototypeBuilding::PrimarySchool.define_hvac_system_map(building_type, template, climate_zone)
    when 'SmallOffice'
      return PrototypeBuilding::SmallOffice.define_hvac_system_map(building_type, template, climate_zone)
    when 'MediumOffice'
      return PrototypeBuilding::MediumOffice.define_hvac_system_map(building_type, template, climate_zone)
    when 'LargeOffice'
      return PrototypeBuilding::LargeOffice.define_hvac_system_map(building_type, template, climate_zone)
    when 'SmallHotel'
      return PrototypeBuilding::SmallHotel.define_hvac_system_map(building_type, template, climate_zone)
    when 'LargeHotel'
      return PrototypeBuilding::LargeHotel.define_hvac_system_map(building_type, template, climate_zone)
    when 'Warehouse'
      return PrototypeBuilding::Warehouse.define_hvac_system_map(building_type, template, climate_zone)
    when 'RetailStandalone'
      return PrototypeBuilding::RetailStandalone.define_hvac_system_map(building_type, template, climate_zone)
    when 'RetailStripmall'
      return PrototypeBuilding::RetailStripmall.define_hvac_system_map(building_type, template, climate_zone)
    when 'QuickServiceRestaurant'
      return PrototypeBuilding::QuickServiceRestaurant.define_hvac_system_map(building_type, template, climate_zone)
    when 'FullServiceRestaurant'
      return PrototypeBuilding::FullServiceRestaurant.define_hvac_system_map(building_type, template, climate_zone)
    when 'Hospital'
      return PrototypeBuilding::Hospital.define_hvac_system_map(building_type, template, climate_zone)
    when 'Outpatient'
      return PrototypeBuilding::Outpatient.define_hvac_system_map(building_type, template, climate_zone)
    when 'MidriseApartment'
      return PrototypeBuilding::MidriseApartment.define_hvac_system_map(building_type, template, climate_zone)
    when 'HighriseApartment'
      return PrototypeBuilding::HighriseApartment.define_hvac_system_map(building_type, template, climate_zone)
    else
      OpenStudio.logFree(OpenStudio::Error, 'openstudio.model.Model.define_hvac_system_map', "Building Type = #{building_type} not recognized")
      return false
    end
  end

  def custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    case building_type
    when 'SecondarySchool'
      return PrototypeBuilding::SecondarySchool.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'PrimarySchool'
      return PrototypeBuilding::PrimarySchool.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'SmallOffice'
      return PrototypeBuilding::SmallOffice.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'MediumOffice'
      return PrototypeBuilding::MediumOffice.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'LargeOffice'
      return PrototypeBuilding::LargeOffice.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'SmallHotel'
      return PrototypeBuilding::SmallHotel.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'LargeHotel'
      return PrototypeBuilding::LargeHotel.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'Warehouse'
      return PrototypeBuilding::Warehouse.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'RetailStandalone'
      return PrototypeBuilding::RetailStandalone.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'RetailStripmall'
      return PrototypeBuilding::RetailStripmall.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'QuickServiceRestaurant'
      return PrototypeBuilding::QuickServiceRestaurant.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'FullServiceRestaurant'
      return PrototypeBuilding::FullServiceRestaurant.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'Hospital'
      return PrototypeBuilding::Hospital.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'Outpatient'
      return PrototypeBuilding::Outpatient.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'MidriseApartment'
      return PrototypeBuilding::MidriseApartment.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'HighriseApartment'
      return PrototypeBuilding::HighriseApartment.custom_hvac_tweaks(building_type, template, climate_zone, prototype_input, model)
    else
      OpenStudio.logFree(OpenStudio::Error, 'openstudio.model.Model.custom_hvac_tweaks', "Building Type = #{building_type} not recognized")
      return false
    end
  end

  def custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    case building_type
    when 'SecondarySchool'
      return PrototypeBuilding::SecondarySchool.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'PrimarySchool'
      return PrototypeBuilding::PrimarySchool.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'SmallOffice'
      return PrototypeBuilding::SmallOffice.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'MediumOffice'
      return PrototypeBuilding::MediumOffice.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'LargeOffice'
      return PrototypeBuilding::LargeOffice.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'SmallHotel'
      return PrototypeBuilding::SmallHotel.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'LargeHotel'
      return PrototypeBuilding::LargeHotel.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'Warehouse'
      return PrototypeBuilding::Warehouse.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'RetailStandalone'
      return PrototypeBuilding::RetailStandalone.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'RetailStripmall'
      return PrototypeBuilding::RetailStripmall.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'QuickServiceRestaurant'
      return PrototypeBuilding::QuickServiceRestaurant.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'FullServiceRestaurant'
      return PrototypeBuilding::FullServiceRestaurant.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'Hospital'
      return PrototypeBuilding::Hospital.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'Outpatient'
      return PrototypeBuilding::Outpatient.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'MidriseApartment'
      return PrototypeBuilding::MidriseApartment.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    when 'HighriseApartment'
      return PrototypeBuilding::HighriseApartment.custom_swh_tweaks(building_type, template, climate_zone, prototype_input, model)
    else
      OpenStudio.logFree(OpenStudio::Error, 'openstudio.model.Model.custom_swh_tweaks', "Building Type = #{building_type} not recognized")
      return false
    end
  end
end
