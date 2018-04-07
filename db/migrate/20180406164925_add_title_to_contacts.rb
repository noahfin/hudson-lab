class AddTitleToContacts < ActiveRecord::Migration[5.1]
  def change
     add_column :contacts, :title, :string
  end
end
