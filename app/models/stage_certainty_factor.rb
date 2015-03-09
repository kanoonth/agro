class StageCertaintyFactor < ActiveRecord::Base
  
  include ValidationHelper
  include CertaintyFactorsHelper

  belongs_to :stage
  belongs_to :disease

  before_save :check_cf
  validates :cf, presence: true
end
