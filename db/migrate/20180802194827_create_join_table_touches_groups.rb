class CreateJoinTableTouchesGroups < ActiveRecord::Migration[5.2]
  def change
    create_join_table :touches, :groups do |t|
      t.index [:touch_id, :group_id]
      t.index [:group_id, :touch_id]
    end
  end
end
