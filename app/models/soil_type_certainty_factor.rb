class SoilTypeCertaintyFactor < ActiveRecord::Base
  belongs_to :disease
  belongs_to :soil_type

  include ValidationHelper
  include CertaintyFactorsHelper

  before_save :check_cf
  validates :cf, presence: true
end
