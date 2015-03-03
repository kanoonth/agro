class CreatePhosphorus < ActiveRecord::Migration
  def change
    create_table :phosphorus do |t|
      t.decimal :min
      t.decimal :max
      t.references :stage, index: true
      t.references :disease, index: true
      t.decimal :cf

      t.timestamps null: false
    end
    add_foreign_key :phosphorus, :stages
    add_foreign_key :phosphorus, :diseases
  end
end
