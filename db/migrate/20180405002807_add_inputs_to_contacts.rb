class AddInputsToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :county, :string
    add_column :contacts, :state, :string
    add_column :contacts, :country, :string
    add_column :contacts, :postal_code, :string
    add_column :contacts, :notes, :text
    add_column :contacts, :city, :string
    add_column :contacts, :street_num, :string
    add_column :contacts, :strret_name, :string
  end
end
