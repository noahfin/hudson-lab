class CreateJoinTableLeadsContacts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :leads, :contacts do |t|
      t.index [:lead_id, :contact_id]
      t.index [:contact_id, :lead_id]
    end
  end
end
