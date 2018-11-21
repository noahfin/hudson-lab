class AddAddressToDeal < ActiveRecord::Migration[5.2]
  def change
     add_column :deals, :full_address, :string
  end
end
