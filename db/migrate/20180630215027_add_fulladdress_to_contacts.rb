class AddFulladdressToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :Fulladdress, :string
  end
end
