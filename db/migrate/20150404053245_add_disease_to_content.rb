class AddDiseaseToContent < ActiveRecord::Migration
  def change
  	add_reference :contents, :disease
  end
end
