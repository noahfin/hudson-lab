class RemoveUserReferenceFromGroups < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :groups, name: "index_groups_on_user_id"
    remove_column :groups, :user_id, :integer
  end
end
