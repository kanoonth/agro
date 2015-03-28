class ContentImage < ActiveRecord::Base
	belongs_to :content
	validates :link, presence: true
	validates :title, presence: true
end
