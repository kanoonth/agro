class AreaTypeCertaintyFactor < ActiveRecord::Base
  belongs_to :disease
  belongs_to :area_type

  include ValidationHelper

  before_save :check_cf
  validates :cf, presence: true
end
