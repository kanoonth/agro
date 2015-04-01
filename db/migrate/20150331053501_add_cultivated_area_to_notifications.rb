class AddCultivatedAreaToNotifications < ActiveRecord::Migration
  def change
    add_reference :notifications, :cultivated_area, index: true
    add_foreign_key :notifications, :cultivated_areas
  end
end
