class CreateEcologies < ActiveRecord::Migration
  def change
    create_table :ecologies do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
