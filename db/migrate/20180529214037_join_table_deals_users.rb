class JoinTableDealsUsers < ActiveRecord::Migration[5.1]
  def change
     create_join_table :deals, :users do |t|
      t.index [:deal_id, :user_id]
      t.index [:user_id, :deal_id]
    end
  end
end
