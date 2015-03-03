class CreateSoilMoistures < ActiveRecord::Migration
  def change
    create_table :soil_moistures do |t|
      t.decimal :min
      t.decimal :max
      t.references :disease, index: true
      t.decimal :cf

      t.timestamps null: false
    end
    add_foreign_key :soil_moistures, :diseases
  end
end
