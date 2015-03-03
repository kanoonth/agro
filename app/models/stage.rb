class Stage < ActiveRecord::Base
	has_many :nitrogens
	has_many :diseases, through: :nitrogens
	has_many :phosphorus
	has_many :diseases, through: :phosphorus
	has_many :photassium
	has_many :diseases, through: :photassium
	has_many :stage_certainty_factors
	has_many :diseases, through: :stage_certainty_factors
end
