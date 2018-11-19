class CreateJoinTableCategoriesContacts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :contacts do |t|
      t.index [:category_id, :contact_id]
      t.index [:contact_id, :category_id]
    end
  end
end
