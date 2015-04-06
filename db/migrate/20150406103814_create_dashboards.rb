class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.decimal :temperature
      t.decimal :rain
      t.decimal :wind
      t.decimal :air_moisture
      t.references :province, index: true

      t.timestamps null: false
    end
    add_foreign_key :dashboards, :provinces
  end
end
