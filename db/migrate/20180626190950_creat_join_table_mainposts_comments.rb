class CreatJoinTableMainpostsComments < ActiveRecord::Migration[5.2]
  def change
    create_join_table :mainposts, :comments do |t|
      t.index [:mainpost_id, :comment_id]
      t.index [:comment_id, :mainpost_id]
    end
  end
end
