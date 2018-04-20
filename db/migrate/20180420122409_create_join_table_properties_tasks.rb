class CreateJoinTablePropertiesTasks < ActiveRecord::Migration[5.1]
  def change
    create_join_table :properties, :tasks do |t|
      t.index [:property_id, :task_id]
      t.index [:task_id, :property_id]
    end
  end
end
