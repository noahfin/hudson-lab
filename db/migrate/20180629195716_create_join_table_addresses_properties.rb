class CreateJoinTableAddressesProperties < ActiveRecord::Migration[5.2]
  def change
    create_join_table :addresses, :properties do |t|
      t.index [:address_id, :property_id]
      t.index [:property_id, :address_id]
    end
  end
end
