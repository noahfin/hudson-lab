class CreateJoinTableSearchedsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :searcheds, :users do |t|
      t.index [:searched_id, :user_id]
      t.index [:user_id, :searched_id]
    end
  end
end
