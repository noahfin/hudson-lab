class CreateJoinTableCategoriesGroups < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :groups do |t|
      t.index [:category_id, :group_id]
      t.index [:group_id, :category_id]
    end
  end
end
