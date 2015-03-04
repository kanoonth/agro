class AddCfToRegionCertaintyFactors < ActiveRecord::Migration
  def change
    add_column :region_certainty_factors, :cf, :decimal
  end
end
