class StageCertaintyFactor < ActiveRecord::Base
  belongs_to :stage
  belongs_to :disease
end
