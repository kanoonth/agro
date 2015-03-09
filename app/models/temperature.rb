class Temperature < ActiveRecord::Base
  
  include ValidationHelper
  include CertaintyFactorsHelper
  include MinMaxHelper

  before_save :check_min_max
  before_save :check_cf

  belongs_to :disease

  validates :cf, presence: true


end
