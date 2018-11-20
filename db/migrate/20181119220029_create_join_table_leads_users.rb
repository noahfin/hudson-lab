class CreateJoinTableLeadsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :leads, :users do |t|
      t.index [:lead_id, :user_id]
      t.index [:user_id, :lead_id]
    end
  end
end
