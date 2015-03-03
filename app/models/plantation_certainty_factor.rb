class PlantationCertaintyFactor < ActiveRecord::Base
  belongs_to :disease
  belongs_to :plantation
end
