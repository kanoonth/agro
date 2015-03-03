class CreateWinds < ActiveRecord::Migration
  def change
    create_table :winds do |t|
      t.decimal :min
      t.decimal :max
      t.references :disease, index: true
      t.decimal :cf

      t.timestamps null: false
    end
    add_foreign_key :winds, :diseases
  end
end
