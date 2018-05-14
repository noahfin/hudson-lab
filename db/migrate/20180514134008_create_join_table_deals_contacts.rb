class CreateJoinTableDealsContacts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :deals, :contacts do |t|
      t.index [:deal_id, :contact_id]
      t.index [:contact_id, :deal_id]
    end
  end
end
