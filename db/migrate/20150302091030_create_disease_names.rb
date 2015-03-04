class CreateDiseaseNames < ActiveRecord::Migration
  def change
    create_table :disease_names do |t|
      t.string :name
      t.references :disease, index: true

      t.timestamps null: false
    end
    add_foreign_key :disease_names, :diseases
  end
end
