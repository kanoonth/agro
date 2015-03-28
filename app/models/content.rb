class Content < ActiveRecord::Base
  has_many :content_images
  has_one :content_type
  has_many :comments
  has_many :rates
  validates :title, presence: true
  validates :body, presence: true
end
