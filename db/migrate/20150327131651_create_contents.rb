class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.string :body
      t.references :content_images, index: true
      t.references :content_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :contents, :content_images
    add_foreign_key :contents, :content_types
  end
end
