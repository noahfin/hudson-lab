class AddPersonalEmailToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :personal_email, :string
  end
end
