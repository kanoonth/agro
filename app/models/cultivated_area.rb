class CultivatedArea < ActiveRecord::Base
  belongs_to :plantation
  belongs_to :user

  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
end
