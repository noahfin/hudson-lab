class CreateJoinTableAddressesDeals < ActiveRecord::Migration[5.2]
  def change
    create_join_table :addresses, :deals do |t|
      t.index [:address_id, :deal_id]
      t.index [:deal_id, :address_id]
    end
  end
end
