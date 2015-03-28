class SoilType < ActiveRecord::Base
	has_many :soil_type_certainty_factors
	has_many :disease, through: :soil_type_certainty_factors
	has_many :cultivated_areas

	validates :name, presence: true
end
