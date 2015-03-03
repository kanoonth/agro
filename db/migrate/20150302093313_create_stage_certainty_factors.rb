class CreateStageCertaintyFactors < ActiveRecord::Migration
  def change
    create_table :stage_certainty_factors, :id => false do |t|
      t.decimal :cf
      t.references :stage, index: true
      t.references :disease, index: true

      t.timestamps null: false
    end
    add_foreign_key :stage_certainty_factors, :stages
    add_foreign_key :stage_certainty_factors, :diseases
  end
end
