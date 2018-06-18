class AddTheRightFieldsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :date_range, :string
    add_column :events, :start, :string
    add_column :events, :end, :string
    add_column :events, :color, :string
  end
end
