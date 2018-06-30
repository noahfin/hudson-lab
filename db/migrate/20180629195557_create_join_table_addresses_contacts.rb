class CreateJoinTableAddressesContacts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :addresses, :contacts do |t|
      t.index [:address_id, :contact_id]
      t.index [:contact_id, :address_id]
    end
  end
end
