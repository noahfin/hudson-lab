class AddCatsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :development, :boolean
    add_column :projects, :maintenance, :boolean
    add_column :projects, :technology, :boolean
    add_column :projects, :business, :boolean
  end
end
