class ContentType < ActiveRecord::Base
	belongs_to :content
	validates :name, presence: true
end
