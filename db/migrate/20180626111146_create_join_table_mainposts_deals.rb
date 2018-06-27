class CreateJoinTableMainpostsDeals < ActiveRecord::Migration[5.2]
  def change
    create_join_table :mainposts, :deals do |t|
      t.index [:mainpost_id, :deal_id]
      t.index [:deal_id, :mainpost_id]
    end
  end
end
