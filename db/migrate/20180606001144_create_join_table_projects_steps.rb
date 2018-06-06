class CreateJoinTableProjectsSteps < ActiveRecord::Migration[5.1]
  def change
    create_join_table :projects, :steps do |t|
      t.index [:project_id, :step_id]
      t.index [:step_id, :project_id]
    end
  end
end
