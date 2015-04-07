class CreateContentTypes < ActiveRecord::Migration
  def change
    create_table :content_types do |t|
      t.string :name
      t.timestamps null: false
    end
    # add_foreign_key :content_types, :contents
  end
end
