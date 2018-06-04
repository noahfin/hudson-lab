class CreateJoinTableTasksTeams < ActiveRecord::Migration[5.1]
 def change
    create_join_table :tasks, :teams do |t|
      t.index [:task_id, :team_id]
      t.index [:team_id, :task_id]
    end
  end
end
