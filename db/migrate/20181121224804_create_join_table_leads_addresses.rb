class CreateJoinTableLeadsAddresses < ActiveRecord::Migration[5.2]
  def change
    create_join_table :leads, :addresses do |t|
      t.index [:lead_id, :address_id]
      t.index [:address_id, :lead_id]
    end
  end
end
