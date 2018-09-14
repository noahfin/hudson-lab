class CreateJoinTableSearchedsContacts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :searcheds, :contacts do |t|
      t.index [:searched_id, :contact_id]
      t.index [:contact_id, :searched_id]
    end
  end
end
