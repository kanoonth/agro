class Notification < ActiveRecord::Base
  belongs_to :disease

  def self.get_stage_cf(disease, age)
  	stage = disease.stages.where("min_day <= ? AND max_day >= ?", age, age).first
 	  StageCertaintyFactor.where(disease_id: disease.id, stage_id: stage.id).first.factor
  end

  def self.get_region_cf(disease, region_name)
  	region = disease.regions.where(name: region_name).first
  	RegionCertaintyFactor.where(disease_id: disease.id, region_id: region.id).first.factor
  end

  def self.get_ecology_cf(disease, ecology_name)
    ecology = disease.ecologies.where(name: ecology_name).first
    EcologyCertaintyFactor.where(disease_id: disease.id, ecology_id: ecology.id).first.factor
  end

  def self.get_area_type_cf(disease, area_type_name)
    area_type = disease.area_types.where(name: area_type_name).first
    AreaTypeCertaintyFactor.where(disease_id: disease.id, area_type_id: area_type.id).first.factor
  end

  def self.get_plantation_cf(disease, plantation_name)
    plantation = disease.plantations.where(name: plantation_name).first
    PlantationCertaintyFactor.where(disease_id: disease.id, plantation_id: plantation.id).first.factor
  end

  def self.get_soil_type_cf(disease, soil_type_name)
    soil_type = disease.soil_types.where(name: soil_type_name ).first
    SoilTypeCertaintyFactor.where(disease_id: disease.id, soil_type_id: soil_type.id).first.factor
  end

  def self.get_phosphoru_cf(disease, value, age)
    stages = disease.stages.where("min_day <= ? AND max_day >= ?", age, age)
    cf = 0
    stages.each do |stage|
      begin
        cf = if cf == 0
          Phosphoru.where(disease_id: disease.id, stage_id: stage.id).first.factor
        else
          union_cf(cf, Phosphoru.where(disease_id: disease.id, stage_id: stage.id).first.factor)
        end
      rescue

      end
    end
    cf
  end

  def self.get_nitrogen_cf(disease, value, age)
    stages = disease.stages.where("min_day <= ? AND max_day >= ?", age, age)
    cf = 0
    stages.each do |stage|
      begin
        cf = if cf == 0
          Nitrogen.where(disease_id: disease.id, stage_id: stage.id).first.factor
        else
          union_cf(cf, Nitrogen.where(disease_id: disease.id, stage_id: stage.id).first.factor)
        end
      rescue

      end
    end
    cf
  end

  def self.get_potassium_cf(disease, value, age)
    stages = disease.stages.where("min_day <= ? AND max_day >= ?", age, age)
    cf = 0
    stages.each do |stage|
      begin
        cf = if cf == 0
          Potassium.where(disease_id: disease.id, stage_id: stage.id).first.factor
        else
          union_cf(cf, Potassium.where(disease_id: disease.id, stage_id: stage.id).first.factor)
        end
      rescue

      end
    end
    cf
  end

  # Rain or Temperature or Wind or AirMoisture or SoilMoisture
  def self.get_rtw_cf(value, rtw)
  	cf = if rtw.maxf.zero? and value > rtw.minf
  	  rtw.factor
  	elsif (rtw.minf..rtw.maxf).include? value
  	  rtw.factor
    else
      0
  	end
  end

  def self.union_cf(cf1, cf2)
  	cf1 + cf2 - cf1 * cf2
  end

  def self.predict
   	# age = Date.parse(Time.now.to_s) - date 
   	a = Hash.new
   	age = 40
   	region_name = "North_East"
   	temperature = 40
    wind = 10
    rain = 20
    ecology_name = "Ecology_B"
    soil_mositure = 80
    air_mositure = 30
    area_type_name = "AreaType_B"
    plantation_name = "Plantation_B"
    soil_type_name = "SoilType_B"
    phosphoru = 4
    nitrogen = 1.5
    potassium = 8

   	Disease.all.each do |disease|
   	  cf = get_stage_cf(disease, age)
      cf = union_cf(cf, get_region_cf(disease ,region_name))
      cf = union_cf(cf, get_ecology_cf(disease, ecology_name))
      cf = union_cf(cf, get_area_type_cf(disease, area_type_name))
      cf = union_cf(cf, get_plantation_cf(disease, plantation_name))
      cf = union_cf(cf, get_phosphoru_cf(disease, phosphoru, age))
      cf = union_cf(cf, get_nitrogen_cf(disease, nitrogen, age))
      cf = union_cf(cf, get_potassium_cf(disease, potassium, age))
      
      unless disease.soil_types.empty?
        cf = union_cf(cf, get_soil_type_cf(disease, soil_type_name))
      end

      if disease.temperature
  	    cf = union_cf(cf, get_rtw_cf(temperature, disease.temperature)) 
      end 

      if disease.rain
        cf = union_cf(cf, get_rtw_cf(rain, disease.rain))
      end

      if disease.wind
        cf = union_cf(cf, get_rtw_cf(wind, disease.wind)) 
      end 

      if disease.air_moisture
        cf = union_cf(cf, get_rtw_cf(wind, disease.air_moisture)) 
      end 

      if disease.soil_moisture
        cf = union_cf(cf, get_rtw_cf(wind, disease.soil_moisture)) 
      end 

  	  puts cf
   	  a[disease.name] = cf
    end
  end
end
