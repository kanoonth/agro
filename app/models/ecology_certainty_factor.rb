class EcologyCertaintyFactor < ActiveRecord::Base
  belongs_to :disease
  belongs_to :ecology

  include ValidationHelper

  before_save :check_cf
  validates :cf, presence: true
end
