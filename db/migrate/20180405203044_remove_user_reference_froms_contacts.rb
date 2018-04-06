class RemoveUserReferenceFromsContacts < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :contacts, name: "index_contacts_on_user_id"
  end
end
