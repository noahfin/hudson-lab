class AddThingsToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :thing, :string
    add_column :notifications, :thing_id, :string
  end
end
