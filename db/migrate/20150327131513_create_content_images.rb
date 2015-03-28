class CreateContentImages < ActiveRecord::Migration
  def change
    create_table :content_images do |t|
      t.string :title
      t.string :link
      t.references :content
      t.timestamps null: false
    end
  end
end
