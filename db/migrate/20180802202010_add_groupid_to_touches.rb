class AddGroupidToTouches < ActiveRecord::Migration[5.2]
  def change
    add_column :touches, :group_id, :string
  end
end
