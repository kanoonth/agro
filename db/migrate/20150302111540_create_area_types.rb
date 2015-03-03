class CreateAreaTypes < ActiveRecord::Migration
  def change
    create_table :area_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
