class PlantationCertaintyFactor < ActiveRecord::Base
  belongs_to :disease
  belongs_to :plantation

  include ValidationHelper
  include CertaintyFactorsHelper

  before_save :check_cf
  validates :cf, presence: true
end
