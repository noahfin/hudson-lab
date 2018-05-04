class AddMoreToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :first_name, :string
    add_column :contacts, :last_name, :string
    add_column :contacts, :middle_name, :string
    add_column :contacts, :suffix, :string
    add_column :contacts, :postion, :string
    add_column :contacts, :type, :string
  end
end
