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
    area_type = disease.area_types.where(name: area_type_name)
    unless area_type.empty?
      AreaTypeCertaintyFactor.where(disease_id: disease.id, area_type_id: area_type.first.id).first.factor
    else 
      0
    end
  end

  def self.get_plantation_cf(disease, plantation_name)
    plantation = disease.plantations.where(name: plantation_name)
    unless plantation.empty?
      PlantationCertaintyFactor.where(disease_id: disease.id, plantation_id: plantation.first.id).first.factor
    else
      0
    end
  end

  def self.get_soil_type_cf(disease, soil_type_name)
    soil_type = disease.soil_types.where(name: soil_type_name )
    unless soil_type.empty?
      SoilTypeCertaintyFactor.where(disease_id: disease.id, soil_type_id: soil_type.id).first.factor
    else
      0
    end
  end

  def self.get_phosphoru_cf(disease, value, age)
    stages = disease.stages.where("min_day <= ? AND max_day >= ?", age, age)
    cf = 0
    stages.each do |stage|
      phosphoru = Phosphoru.where(disease_id: disease.id, stage_id: stage.id)
      unless phosphoru.empty?
        cf = union_cf(cf, phosphoru.first.factor)
      end
    end
    cf
  end

  def self.get_nitrogen_cf(disease, value, age)
    stages = disease.stages.where("min_day <= ? AND max_day >= ?", age, age)
    cf = 0
    stages.each do |stage|
      nitrogen = Nitrogen.where(disease_id: disease.id, stage_id: stage.id)
      unless nitrogen.empty?
        cf = union_cf(cf, nitrogen.first.factor)
      end
    end
    cf
  end

  def self.get_potassium_cf(disease, value, age)
    stages = disease.stages.where("min_day <= ? AND max_day >= ?", age, age)
    cf = 0
    stages.each do |stage|
      potassium = Potassium.where(disease_id: disease.id, stage_id: stage.id)
      unless potassium.empty?
        cf = union_cf(cf, potassium.first.factor)
      end
    end
    cf
  end

  # Rain or Temperature or Wind or AirMoisture or SoilMoisture
  def self.get_rtw_cf(value, rtw)
  	cf = if rtw.nil?
      0
    elsif rtw.maxf.zero? and value > rtw.minf
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

  def self.predict(age,phosphoru,nitrogen,potassium,temperature,rain,wind,air_moisture,soil_moisture,
      region_name,ecology_name,area_type_name,plantation_name,soil_type_name)
   	# age = Date.parse(Time.now.to_s) - date 
   	diseases = Hash.new
   	age = 10
   	region_name = "East"
   	temperature = 25
    wind = 5
    rain = 0
    ecology_name = "Ecology_A"
    soil_mositure = 15
    air_mositure = 70
    area_type_name = "AreaType_A"
    plantation_name = "Plantation_A"
    soil_type_name = "SoilType_A"
    phosphoru = 8
    nitrogen = 3
    potassium = 5

   	Disease.all.each do |disease|
      cf = 0

      stage_cf = get_stage_cf(disease, age)
      cf = union_cf(cf, stage_cf)
      
      region_cf = get_region_cf(disease ,region_name)
      cf = union_cf(cf, region_cf)

      ecology_cf = get_ecology_cf(disease, ecology_name)
      cf = union_cf(cf, ecology_cf)

      area_type_cf = get_area_type_cf(disease, area_type_name)
      cf = union_cf(cf, area_type_cf)

      plantation_cf = get_plantation_cf(disease, plantation_name)
      cf = union_cf(cf, plantation_cf)

      phosphoru_cf = get_phosphoru_cf(disease, phosphoru, age)
      cf = union_cf(cf, phosphoru_cf)

      nitrogen_cf = get_nitrogen_cf(disease, nitrogen, age)
      cf = union_cf(cf, nitrogen_cf)

      potassium_cf = get_potassium_cf(disease, potassium, age)
      cf = union_cf(cf, potassium_cf)
      
      soil_type_cf = get_soil_type_cf(disease, soil_type_name)
      cf = union_cf(cf, soil_type_cf)

      temperature_cf = get_rtw_cf(temperature, disease.temperature)
	    cf = union_cf(cf, temperature_cf) 

      rain_cf = get_rtw_cf(rain, disease.rain)
      cf = union_cf(cf, rain_cf)

      wind_cf = get_rtw_cf(wind, disease.wind)
      cf = union_cf(cf, wind_cf) 

      air_moisture_cf = get_rtw_cf(wind, disease.air_moisture)
      cf = union_cf(cf, air_moisture_cf) 

      soil_moisture_cf = get_rtw_cf(wind, disease.soil_moisture)
      cf = union_cf(cf, soil_moisture_cf) 

   	  diseases[disease.name] = cf
    end
    diseases
  end
end
