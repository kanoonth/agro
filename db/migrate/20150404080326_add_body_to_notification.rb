class AddBodyToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :body, :string
  end
end
