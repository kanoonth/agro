class EcologyCertaintyFactor < ActiveRecord::Base
  belongs_to :disease
  belongs_to :ecology
end
