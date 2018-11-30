class CreateJoinTableOwnersContacts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :owners, :contacts do |t|
      t.index [:owner_id, :contact_id]
      t.index [:contact_id, :owner_id]
    end
  end
end
