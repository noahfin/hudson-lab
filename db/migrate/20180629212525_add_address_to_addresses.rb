class AddAddressToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :address, :string
  end
end
