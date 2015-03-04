class Region < ActiveRecord::Base
	has_many :region_certainty_factors
	has_many :disease, through: :region_certainty_factors

	has_one :province

	validates :name, presence: true
end
