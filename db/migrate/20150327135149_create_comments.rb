class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.references :content, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
    add_foreign_key :comments, :contents
  end
end
