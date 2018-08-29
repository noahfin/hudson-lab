class AddFulladdressToCancontacts < ActiveRecord::Migration[5.2]
  def change
    add_column :cancontacts, :name, :string
    add_column :cancontacts, :email, :string
    add_column :cancontacts, :company, :string
    add_column :cancontacts, :address, :string
    add_column :cancontacts, :Fulladdress, :string
    add_column :cancontacts, :phone, :string
    add_column :cancontacts, :cell, :string
  end
end
