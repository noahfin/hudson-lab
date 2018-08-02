class AddGroupNameToTouches < ActiveRecord::Migration[5.2]
  def change
    add_column :touches, :group_name, :string
  end
end
