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
	has_many :stages, through: :soil_type_certainty_factors

	has_many :plantation_certainty_factors, dependent: :destroy
	has_many :plantations, through: :plantation_certainty_factors

	has_many :area_type_certainty_factor, dependent: :destroy
	has_many :area_type, through: :area_type_certainty_factor

	has_many :ecology_certanty_factors
	has_many :ecologys, through: :ecology_certanty_factors

	has_many :region_certainty_factors
	has_many :regions, through: :region_certainty_factors

	has_one :soil_moisture
	has_one :air_moisture
	has_one :winds
	has_one :rains
	has_one :temperatures

	has_many :disease_names
	validates :name, presence: true
end
