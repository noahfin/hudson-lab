class PageUrlAToContacts < ActiveRecord::Migration[5.2]
  def change
     add_column :contacts, :page_url, :string
  end
end
