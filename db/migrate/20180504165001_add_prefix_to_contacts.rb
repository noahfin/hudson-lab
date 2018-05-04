class AddPrefixToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :prefix, :string
  end
end
