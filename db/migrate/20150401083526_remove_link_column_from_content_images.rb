class RemoveLinkColumnFromContentImages < ActiveRecord::Migration
  def up
  	remove_column :content_images, :link
  	add_attachment :content_images, :image 
  end

  def down
  	add_column :content_images, :link, :string
  	remove_attachment :content_images, :image
  end
end
