class Province < ActiveRecord::Base
  belongs_to :region

  validates :name, presence: true
end
