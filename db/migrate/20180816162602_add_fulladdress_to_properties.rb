class AddFulladdressToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :Fulladdress, :string
  end
end
