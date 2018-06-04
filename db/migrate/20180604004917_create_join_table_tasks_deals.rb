class CreateJoinTableTasksDeals < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tasks, :deals do |t|
      t.index [:task_id, :deal_id]
      t.index [:deal_id, :task_id]
    end
  end
end
