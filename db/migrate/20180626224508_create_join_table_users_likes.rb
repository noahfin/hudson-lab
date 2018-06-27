class CreateJoinTableUsersLikes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :likes do |t|
      # t.index [:user_id, :like_id]
      # t.index [:like_id, :user_id]
    end
  end
end
