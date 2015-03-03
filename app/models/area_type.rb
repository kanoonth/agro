class AreaType < ActiveRecord::Base
	has_many :area_type_certainty_factor
	has_many :disease, through: :area_type_certainty_factor
end
