class AddCultivatedToDashboard < ActiveRecord::Migration
  def up
  	remove_column :dashboards, :province_id
  	add_reference :dashboards, :cultivated_area
  end

  def down
  	remove_column :dashboards, :cultivated_area
  	add_reference :dashboards, :province 
  end

end
