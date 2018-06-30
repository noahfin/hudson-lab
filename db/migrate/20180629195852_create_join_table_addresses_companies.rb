class CreateJoinTableAddressesCompanies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :addresses, :companies do |t|
      t.index [:address_id, :company_id]
      t.index [:company_id, :address_id]
    end
  end
end
