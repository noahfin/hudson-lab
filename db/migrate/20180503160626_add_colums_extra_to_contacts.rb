class AddColumsExtraToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :web_address, :string
    add_column :contacts, :zip_code_ext, :string
    add_column :contacts, :facility_size, :string
    add_column :contacts, :latitude, :string
    add_column :contacts, :year_of_Founding, :string
    add_column :contacts, :owns_cents, :string
    add_column :contacts, :primary_industry, :string
    add_column :contacts, :sic, :string
  end
end
