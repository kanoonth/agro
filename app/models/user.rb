class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :authentication_keys => [:username]

  has_many :cultivated_areas

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :tel, presence: true
end
