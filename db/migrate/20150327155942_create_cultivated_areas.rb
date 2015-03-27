class CreateCultivatedAreas < ActiveRecord::Migration
  def change
    create_table :cultivated_areas do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.references :plantation, index: true
      t.references :user, index:true
      t.date :plantation_date


      t.timestamps null: false
    end
    add_foreign_key :cultivated_areas, :plantations
    add_foreign_key :cultivated_areas, :users
  end
end
