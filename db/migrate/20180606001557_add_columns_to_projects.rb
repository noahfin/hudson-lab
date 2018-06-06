class AddColumnsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :projected_start_time, :datetime
    add_column :projects, :projected_finish_time, :datetime
    add_column :projects, :actual_start_time, :datetime
    add_column :projects, :actual_finshed_time, :datetime
    add_column :projects, :staffing, :string
    add_column :projects, :resources, :string
    add_column :projects, :requirements, :string
  end
end
