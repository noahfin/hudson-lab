class CreateJoinTableMainpostsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :mainposts, :users do |t|
      t.index [:mainpost_id, :user_id]
      t.index [:user_id, :mainpost_id]
    end
  end
end
