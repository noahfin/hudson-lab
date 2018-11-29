class AddLeaseUpToTenants < ActiveRecord::Migration[5.2]
  def change
    add_column :tenants, :lease_up, :date
  end
end
