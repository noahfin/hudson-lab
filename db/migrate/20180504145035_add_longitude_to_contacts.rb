class AddLongitudeToContacts < ActiveRecord::Migration[5.1]
  def change
   add_column :contacts, :longitude, :string
  end
end
