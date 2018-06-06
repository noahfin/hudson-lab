class AddBudgetToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :budget, :decimal
  end
end
