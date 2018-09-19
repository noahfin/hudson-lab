class CreateJoinTableDealsLeads < ActiveRecord::Migration[5.2]
  def change
    create_join_table :deals, :leads do |t|
      t.index [:deal_id, :lead_id]
      t.index [:lead_id, :deal_id]
    end
  end
end
