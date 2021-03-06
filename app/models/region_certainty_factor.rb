class RegionCertaintyFactor < ActiveRecord::Base
  belongs_to :region
  belongs_to :disease

  include ValidationHelper
  include CertaintyFactorsHelper

  before_save :check_cf
  validates :cf, presence: true
end
