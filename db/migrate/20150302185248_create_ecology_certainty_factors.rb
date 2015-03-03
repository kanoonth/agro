class CreateEcologyCertaintyFactors < ActiveRecord::Migration
  def change
    create_table :ecology_certainty_factors do |t|
      t.references :disease, index: true
      t.references :ecology, index: true
      t.decimal :cf

      t.timestamps null: false
    end
    add_foreign_key :ecology_certainty_factors, :diseases
    add_foreign_key :ecology_certainty_factors, :ecologies
  end
end
