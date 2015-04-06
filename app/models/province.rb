class Province < ActiveRecord::Base
  belongs_to :region

  has_many :cultivated_areas

  validates :name, presence: true
  validates :province_id, presence:true
end
