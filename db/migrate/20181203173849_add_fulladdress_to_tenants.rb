class AddFulladdressToTenants < ActiveRecord::Migration[5.2]
  def change
    add_column :tenants, :fulladress, :string
  end
end
