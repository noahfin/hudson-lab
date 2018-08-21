class CreateJoinTableCancontactContacts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cancontacts, :contacts do |t|
      t.index [:cancontact_id, :contact_id]
      t.index [:contact_id, :cancontact_id]
    end
  end
end
