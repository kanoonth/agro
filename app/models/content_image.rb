class ContentImage < ActiveRecord::Base
	belongs_to :content
	validates :title, presence: true
	has_attached_file :image, 
	:styles => { :thumb => "200x200>" }
  	validates_attachment :image, 
  	:content_type => { :content_type => ['image/jpeg', 'image/png']}
  	validates_attachment_presence :image
end
