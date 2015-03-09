class Phosphoru < ActiveRecord::Base
  belongs_to :stage
  belongs_to :disease

  include ValidationHelper
  include CertaintyFactorsHelper
  include MinMaxHelper

  before_save :check_min_max
  before_save :check_cf
  validates :cf, presence: true
end
