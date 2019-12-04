class AddWebbrochureToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :webbrochure, :string
  end
end
