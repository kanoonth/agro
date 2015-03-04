class Stage < ActiveRecord::Base
	has_many :nitrogens
	has_many :diseases, through: :nitrogens
	has_many :phosphorus
	has_many :diseases, through: :phosphorus
	has_many :photassium
	has_many :diseases, through: :photassium
	has_many :stage_certainty_factors
	has_many :diseases, through: :stage_certainty_factors

	validates :name, presence: true

	def check_min_max_day
  	if max_day != 0 && min_day >= max_day
  		errors.add(:max_day, "is Lower then Min")
  		errors.add(:min_day, "is Grater then Max")
  		false
  	end
  end
end
