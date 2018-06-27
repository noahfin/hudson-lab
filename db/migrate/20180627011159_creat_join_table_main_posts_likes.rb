class CreatJoinTableMainPostsLikes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :mainposts, :likes do |t|
      t.index [:mainpost_id, :like_id]
      t.index [:like_id, :mainpost_id]
    end
  end
end
