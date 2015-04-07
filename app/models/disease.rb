class Disease < ActiveRecord::Base
	has_many :nitrogens, dependent: :destroy
	has_many :stages, through: :nitrogens

	has_many :phosphorus, dependent: :destroy
	has_many :stages, through: :phosphorus

	has_many :potassium, dependent: :destroy
	has_many :stages, through: :potassium

	has_many :stage_certainty_factors, dependent: :destroy
	has_many :stages, through: :stage_certainty_factors

	has_many :soil_type_certainty_factors, dependent: :destroy
	has_many :soil_types, through: :soil_type_certainty_factors

	has_many :plantation_certainty_factors, dependent: :destroy
	has_many :plantations, through: :plantation_certainty_factors

	has_many :area_type_certainty_factors, dependent: :destroy
	has_many :area_types, through: :area_type_certainty_factors

	has_many :ecology_certainty_factors
	has_many :ecologies, through: :ecology_certainty_factors

	has_many :region_certainty_factors
	has_many :regions, through: :region_certainty_factors

	has_one :soil_moisture
	has_one :air_moisture
	has_one :wind
	has_one :rain
	has_one :temperature

	has_many :disease_names
	validates :name, presence: true

  def self.add_disease( row1, row2, row3 )

  	a = Disease.create(name: row1[1])



  	## Stage
  	StageCertaintyFactor.create( cf: row1[2], disease: a, stage: Stage.where( name: "ระยะกล้า" ).first )
  	StageCertaintyFactor.create( cf: row1[3], disease: a, stage: Stage.where( name: "ระยะแตกกอ" ).first )
  	StageCertaintyFactor.create( cf: row1[4], disease: a, stage: Stage.where( name: "ระยะออกรวง" ).first )
  	StageCertaintyFactor.create( cf: row1[5], disease: a, stage: Stage.where( name: "ระยะตั้งท้อง" ).first )

  	## Region
  	RegionCertaintyFactor.create( cf: row1[23], disease: a, region: Region.find_by_name( "ภาคเหนือ" ) )
  	RegionCertaintyFactor.create( cf: row1[24], disease: a, region: Region.find_by_name( "ภาคตะวันออก" ) )
  	RegionCertaintyFactor.create( cf: row1[25], disease: a, region: Region.find_by_name( "ภาคตะวันออกเฉียงเหนือ" ) )
  	RegionCertaintyFactor.create( cf: row1[26], disease: a, region: Region.find_by_name( "ภาคกลาง" ) )
  	RegionCertaintyFactor.create( cf: row1[27], disease: a, region: Region.find_by_name( "ภาคใต้" ) )
  	RegionCertaintyFactor.create( cf: row1[28], disease: a, region: Region.find_by_name( "ภาคตะวันตก" ) )

  	## Plantation
  	unless row1[29].nil?
  		PlantationCertaintyFactor.create( cf: row1[29], disease: a, plantation: Plantation.find_by_name( "ปักดำ" ) )
 	end
  	unless row1[30].nil?
  		PlantationCertaintyFactor.create( cf: row1[30], disease: a, plantation: Plantation.find_by_name( "หว่าน" ) )
  	end
  	unless row1[31].nil?
  		PlantationCertaintyFactor.create( cf: row1[31], disease: a, plantation: Plantation.find_by_name( "หยอด" ) )
  	end

  	## Ecology
  	unless row1[32].nil?
  		EcologyCertaintyFactor.create( cf: row1[32], disease: a, ecology: Ecology.find_by_name( "นาน้ำฝน" ) )
 	end
   	unless row1[33].nil?
  		EcologyCertaintyFactor.create( cf: row1[33], disease: a, ecology: Ecology.find_by_name( "นาชลประทาน" ) )
 	end

  	## AreaType
  	unless row1[34].nil?
  		AreaTypeCertaintyFactor.create( cf: row1[34], disease: a, area_type: AreaType.find_by_name( "ที่ลุ่น" ) )
 	end
   	unless row1[35].nil?
  		AreaTypeCertaintyFactor.create( cf: row1[35], disease: a, area_type: AreaType.find_by_name( "ที่ดอน" ) )
 	end

 	## SoilType
  	unless row1[36].nil?
  		SoilTypeCertaintyFactor.create( cf: row1[36], disease: a, soil_type: SoilType.find_by_name( "ดินเหนียว" ) )
 	end
   	unless row1[37].nil?
  		SoilTypeCertaintyFactor.create( cf: row1[37], disease: a, soil_type: SoilType.find_by_name( "ดินร่วน" ) )
 	end
   	unless row1[38].nil?
  		SoilTypeCertaintyFactor.create( cf: row1[38], disease: a, soil_type: SoilType.find_by_name( "ดินทราย" ) )
 	end

 	## AirMoisture
 	unless row2[1].nil?
 		AirMoisture.create( cf: row2[1], min: row3[1], max: row3[2], disease: a )
 	end
 	
 	## Temparature
 	unless row2[2].nil?
 		Temperature.create( cf: row2[2], min: row3[3], max: row3[4], disease: a )
 	end

 	## Wind
 	unless row2[3].nil?
 		Wind.create( cf: row2[3], min: row3[5], max: row3[6], disease: a )
 	end
 	## Rain
 	unless row2[4].nil?
 		Rain.create( cf: row2[4], min: row3[7], max: row3[8], disease: a )
 	end

 	## SoilMoisture
 	unless row2[5].nil?
 		SoilMoisture.create( cf: row2[5], min: row3[9], max: row3[10], disease: a )
 	end

  end

  def self.read_disease_to_record
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet.open 'spreadsheets/rule.xls'
    sheet1 = book.worksheet( 0 )
    sheet2 = book.worksheet( 1 )
    sheet3 = book.worksheet( 2 )

    for i in 4..11
    	row1 = sheet1.row(i)
    	row2 = sheet2.row(i-2)
    	row3 = sheet3.row(i-1)
    	add_disease( row1, row2, row3)
    end
  end

end
