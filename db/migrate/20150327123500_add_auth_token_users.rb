class AddAuthTokenUsers < ActiveRecord::Migration
  def change
  	add_column :users, :auth_token, :string
  end
end
