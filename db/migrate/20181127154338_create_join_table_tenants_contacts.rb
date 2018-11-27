class CreateJoinTableTenantsContacts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tenants, :contacts do |t|
      t.index [:tenant_id, :contact_id]
      t.index [:contact_id, :tenant_id]
    end
  end
end
