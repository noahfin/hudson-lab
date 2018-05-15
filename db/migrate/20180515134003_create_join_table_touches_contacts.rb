class CreateJoinTableTouchesContacts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :touches, :contacts do |t|
      t.index [:touch_id, :contact_id]
      t.index [:contact_id, :touch_id]
    end
  end
end
