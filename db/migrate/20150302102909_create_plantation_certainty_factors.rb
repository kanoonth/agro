class CreatePlantationCertaintyFactors < ActiveRecord::Migration
  def change
    create_table :plantation_certainty_factors do |t|
      t.references :disease, index: true
      t.references :plantation, index: true
      t.decimal :cf

      t.timestamps null: false
    end
    add_foreign_key :plantation_certainty_factors, :diseases
    add_foreign_key :plantation_certainty_factors, :plantations
  end
end
