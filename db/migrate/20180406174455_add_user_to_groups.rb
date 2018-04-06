class AddUserToGroups < ActiveRecord::Migration[5.1]
  def change
    remove_column :groups, :user_id, :integer
    add_reference :groups, :user, foreign_key: true
  end
end
