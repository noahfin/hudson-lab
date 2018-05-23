class AddSuiteToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :suite, :string
  end
end
