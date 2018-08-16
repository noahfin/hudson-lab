class CreateJoinTableDealsMaincomments < ActiveRecord::Migration[5.2]
  def change
    create_join_table :deals, :maincomments do |t|
      t.index [:deal_id, :maincomment_id]
      t.index [:maincomment_id, :deal_id]
    end
  end
end
