class StageCertaintyFactor < ActiveRecord::Base
  belongs_to :stage
  belongs_to :disease

  include ValidationHelper

  before_save :check_cf
  validates :cf, presence: true
end
