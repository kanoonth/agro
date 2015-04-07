class ContentType < ActiveRecord::Base
	has_many :contents
	validates :name, presence: true
end
