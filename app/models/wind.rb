class Wind < ActiveRecord::Base
  belongs_to :disease

  include ValidationHelper

  before_save :check_min_max
  before_save :check_cf
  validates :cf, presence: true
end
