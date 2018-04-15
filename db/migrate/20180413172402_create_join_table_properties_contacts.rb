class CreateJoinTablePropertiesContacts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :properties, :contacts do |t|
      t.index [:property_id, :contact_id]
      t.index [:contact_id, :property_id]
    end
  end
end
