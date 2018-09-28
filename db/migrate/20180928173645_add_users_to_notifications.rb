class AddUsersToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :user_name, :string
    add_column :notifications, :name_id, :string
  end
end
