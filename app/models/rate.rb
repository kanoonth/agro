class Rate < ActiveRecord::Base
  belongs_to :content
  belongs_to :user

  validates :score, presence: true
  validates :user, presence: true
  validates :content, presence: true
end
