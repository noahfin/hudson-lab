class AddSpaceSizeToTeants < ActiveRecord::Migration[5.2]
  def change
    add_column :tenants, :space_size, :string
  end
end
