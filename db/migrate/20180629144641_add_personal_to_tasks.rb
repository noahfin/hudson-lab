class AddPersonalToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :personal, :boolean
  end
end
