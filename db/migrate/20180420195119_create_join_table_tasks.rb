class CreateJoinTableTasks < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tasks, :contacts do |t|
      t.index [:task_id, :contact_id]
      t.index [:contact_id, :task_id]
    end
  end
end
