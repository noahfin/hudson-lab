class CreateJoinTableDealsLikes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :deals, :likes do |t|
      t.index [:deal_id, :like_id]
      t.index [:like_id, :deal_id]
    end
  end
end
