class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :score
      t.references :content, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :rates, :contents
    add_foreign_key :rates, :users
  end
end
