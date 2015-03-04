class Plantation < ActiveRecord::Base
	has_many :plantation_certainty_factors
	has_many :diseases, through: :plantation_certainty_factors

	validates :name, presence: true
end
