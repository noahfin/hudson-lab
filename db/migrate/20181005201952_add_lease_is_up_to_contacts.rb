class AddLeaseIsUpToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :lease_is_up, :datetime
  end
end
