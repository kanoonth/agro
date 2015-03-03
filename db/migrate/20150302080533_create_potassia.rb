class CreatePotassia < ActiveRecord::Migration
  def change
    create_table :potassia do |t|
      t.decimal :min
      t.decimal :max
      t.references :stage, index: true
      t.references :disease, index: true
      t.decimal :cf

      t.timestamps null: false
    end
    add_foreign_key :potassia, :stages
    add_foreign_key :potassia, :diseases
  end
end
