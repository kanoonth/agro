class SoilTypeCertaintyFactor < ActiveRecord::Base
  belongs_to :disease
  belongs_to :soil_type

  include ValidationHelper

  before_save :check_cf
  validates :cf, presence: true
end
