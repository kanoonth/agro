class CreateRains < ActiveRecord::Migration
  def change
    create_table :rains do |t|
      t.decimal :min
      t.decimal :max
      t.references :disease, index: true
      t.decimal :cf

      t.timestamps null: false
    end
    add_foreign_key :rains, :diseases
  end
end
