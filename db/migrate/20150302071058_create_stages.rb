class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.string :name
      t.integer :min_day
      t.integer :max_day

      t.timestamps null: false
    end
  end
end
