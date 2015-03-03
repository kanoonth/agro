class CreateAirMoistures < ActiveRecord::Migration
  def change
    create_table :air_moistures do |t|
      t.decimal :min
      t.decimal :max
      t.references :disease, index: true
      t.decimal :cf

      t.timestamps null: false
    end
    add_foreign_key :air_moistures, :diseases
  end
end
