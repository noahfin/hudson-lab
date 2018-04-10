class AddEmployeeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :employee, :boolean
    add_column :users, :customer, :boolean
    add_column :users, :street_name, :string
    add_column :users, :street_num, :string
    add_column :users, :city, :string
    add_column :users, :county, :string
    add_column :users, :username, :string
  end
end

