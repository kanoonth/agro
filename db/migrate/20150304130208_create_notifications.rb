class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.references :disease, index: true
      t.decimal :cf

      t.timestamps null: false
    end
    add_foreign_key :notifications, :diseases
  end
end
