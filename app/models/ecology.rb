class Ecology < ActiveRecord::Base

	has_many :ecology_certainty_factors
	has_many :diseases, through: :ecology_certainty_factors

	validates :cf, presence: true
end
