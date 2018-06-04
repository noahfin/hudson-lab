class CreateJoinTableTasksLeads < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tasks, :leads do |t|
      t.index [:task_id, :lead_id]
      t.index [:lead_id, :task_id]
    end
  end
end
