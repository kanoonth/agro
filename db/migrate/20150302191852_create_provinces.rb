class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name
      t.references :region, index: true

      t.timestamps null: false
    end
    add_foreign_key :provinces, :regions
  end
end
