class AddEmailToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :county, :string
    add_column :properties, :zip_code, :string
  end
end
