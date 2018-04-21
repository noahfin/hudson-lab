class CreateJoinTableGroupsContacts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :groups, :contacts do |t|
      t.index [:group_id, :contact_id]
      t.index [:contact_id, :group_id]
    end
  end
end
