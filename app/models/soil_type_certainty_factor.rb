class SoilTypeCertaintyFactor < ActiveRecord::Base
  belongs_to :disease
  belongs_to :soil_type
end
