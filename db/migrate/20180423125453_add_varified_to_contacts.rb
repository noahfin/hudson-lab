class AddVarifiedToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :verified, :boolean
  end
end
