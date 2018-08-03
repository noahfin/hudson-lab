class AddClosedToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :closed, :boolean
  end
end
