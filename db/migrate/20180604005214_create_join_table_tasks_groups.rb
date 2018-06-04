class CreateJoinTableTasksGroups < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tasks, :groups do |t|
      t.index [:task_id, :group_id]
      t.index [:group_id, :task_id]
    end
  end
end
