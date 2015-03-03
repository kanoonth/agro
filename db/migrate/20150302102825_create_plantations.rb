class CreatePlantations < ActiveRecord::Migration
  def change
    create_table :plantations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
