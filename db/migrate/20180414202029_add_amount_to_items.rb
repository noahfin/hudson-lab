class AddAmountToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :role, :integer
  end
end
