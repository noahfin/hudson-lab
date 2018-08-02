class AddColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :touch_ids, :integer, array: true, default: []
  end
end
