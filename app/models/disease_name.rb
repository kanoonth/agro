class DiseaseName < ActiveRecord::Base
  belongs_to :disease

  validates :name, presence: true
end
