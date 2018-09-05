class AddFaxToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :fax, :string
  end
end
