class Notification < ActiveRecord::Base
  belongs_to :disease
  belongs_to :cultivated_area

  def self.get_stage_cf(disease, age)
  	stage = disease.stages.where("min_day <= ? AND max_day >= ?", age, age).first
    unless stage.nil?
 	    StageCertaintyFactor.where(disease_id: disease.id, stage_id: stage.id).first.factor
    else
      0
    end
  end

  def self.get_region_cf(disease, region_name)
  	region = disease.regions.where(name: region_name).first
    unless region.nil?
  	 RegionCertaintyFactor.where(disease_id: disease.id, region_id: region.id).first.factor
    else
      0
    end
  end

  def self.get_ecology_cf(disease, ecology_name)
    ecology = disease.ecologies.where(name: ecology_name).first
    unless ecology.nil?
      EcologyCertaintyFactor.where(disease_id: disease.id, ecology_id: ecology.id).first.factor
    else
      0
    end
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

  def self.get_factor(cultivated_area)

    factor = Hash.new
    w_api = Wunderground.new("d326db8a4068ab73")



    wun = w_api.forecast_and_conditions_for(cultivated_area.latitude.to_s + "," + cultivated_area.longitude.to_s)['current_observation']
    factor['temperature'] = wun['temp_c']
    factor['rain'] = wun['precip_today_metric'].to_f
    factor['wind'] = wun['wind_kph']
    am = wun['relative_humidity']
    am["%"] = ""
    factor['air_moisture'] = am.to_f

    factor['region'] = cultivated_area.province.region.name unless cultivated_area.province.nil?
    factor['plantation'] = cultivated_area.plantation.name
    factor['age'] = (Date.current - cultivated_area.plantation_date).to_i

    d = Dashboard.new
    d.temperature = factor['temperature']
    d.rain = factor['rain']
    d.wind = factor['wind']
    d.air_moisture = factor['air_moisture']
    d.cultivated_area = cultivated_area
    d.save

    # factor['area_type'] = cultivated_area.area_type.name
    # factor['soil_type'] = cultivated_area.soil_type.name

    factor
  end

  def self.predict(factor = {})
   	diseases = Hash.new

   	Disease.all.each do |disease|
      cf = 0

      stage_cf = get_stage_cf(disease, factor['age'])
      cf = union_cf(cf, stage_cf)
      
      region_cf = get_region_cf(disease ,factor['region_name'])
      cf = union_cf(cf, region_cf)

      ecology_cf = get_ecology_cf(disease, factor['ecology_name'])
      cf = union_cf(cf, ecology_cf)

      area_type_cf = get_area_type_cf(disease, factor['area_type_name'])
      cf = union_cf(cf, area_type_cf)

      plantation_cf = get_plantation_cf(disease, factor['plantation_name'])
      cf = union_cf(cf, plantation_cf)

      phosphoru_cf = get_phosphoru_cf(disease, factor['phosphoru'], factor['age'])
      cf = union_cf(cf, phosphoru_cf)

      nitrogen_cf = get_nitrogen_cf(disease, factor['nitrogen'], factor['age'])
      cf = union_cf(cf, nitrogen_cf)

      potassium_cf = get_potassium_cf(disease, factor['potassium'], factor['age'])
      cf = union_cf(cf, potassium_cf)
      
      soil_type_cf = get_soil_type_cf(disease, factor['soil_type_name'])
      cf = union_cf(cf, soil_type_cf)

      temperature_cf = get_rtw_cf(factor['temperature'], disease.temperature)
	    cf = union_cf(cf, temperature_cf) 

      rain_cf = get_rtw_cf(factor['rain'], disease.rain)
      cf = union_cf(cf, rain_cf)

      wind_cf = get_rtw_cf(factor['wind'], disease.wind)
      cf = union_cf(cf, wind_cf) 

      air_moisture_cf = get_rtw_cf(factor['air_moisture'], disease.air_moisture)
      cf = union_cf(cf, air_moisture_cf) 

      soil_moisture_cf = get_rtw_cf(factor['wind'], disease.soil_moisture)
      cf = union_cf(cf, soil_moisture_cf) 

   	  diseases[disease.name] = cf
    end
    diseases
  end

  def self.create_notification
    @cultivated_areas = CultivatedArea.all
    @cultivated_areas.each do |cultivated_area|
      diseases = self.predict self.get_factor cultivated_area
      diseases.each do |disease|
        d = Disease.find_by_name(disease[0])
        cf = disease[1]
        if cf > 0.8
          Notification.create!(cultivated_area: cultivated_area,disease: d, cf: cf)
        end
      end
    end
  end

  def percent_cf
    (cf * 100).round.to_s + "%"
  end
end
