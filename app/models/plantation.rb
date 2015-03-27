class Plantation < ActiveRecord::Base
	has_many :plantation_certainty_factors
	has_many :diseases, through: :plantation_certainty_factors
	has_many :cultivated_areas

	validates :name, presence: true
end
