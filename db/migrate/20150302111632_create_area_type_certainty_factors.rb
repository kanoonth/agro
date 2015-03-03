class CreateAreaTypeCertaintyFactors < ActiveRecord::Migration
  def change
    create_table :area_type_certainty_factors do |t|
      t.references :disease, index: true
      t.references :area_type, index: true
      t.decimal :cf

      t.timestamps null: false
    end
    add_foreign_key :area_type_certainty_factors, :diseases
    add_foreign_key :area_type_certainty_factors, :area_types
  end
end
