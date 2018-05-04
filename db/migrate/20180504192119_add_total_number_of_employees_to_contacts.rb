class AddTotalNumberOfEmployeesToContacts < ActiveRecord::Migration[5.1]
  def change
        add_column :contacts, :total_number_of_employees, :string

  end
end
