class AddPriceToTenants < ActiveRecord::Migration[5.2]
  def change
    add_column :tenants, :price, :string
  end
end
