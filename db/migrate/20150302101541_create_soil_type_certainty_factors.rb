class CreateSoilTypeCertaintyFactors < ActiveRecord::Migration
  def change
    create_table :soil_type_certainty_factors do |t|
      t.references :disease, index: true
      t.references :soil_type, index: true
      t.decimal :cf

      t.timestamps null: false
    end
    add_foreign_key :soil_type_certainty_factors, :diseases
    add_foreign_key :soil_type_certainty_factors, :soil_types
  end
end
