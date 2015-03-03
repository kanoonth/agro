class CreateRegionCertaintyFactors < ActiveRecord::Migration
  def change
    create_table :region_certainty_factors, :id => false do |t|
      t.references :region, index: true
      t.references :disease, index: true

      t.timestamps null: false
    end
    add_foreign_key :region_certainty_factors, :regions
    add_foreign_key :region_certainty_factors, :diseases
  end
end
