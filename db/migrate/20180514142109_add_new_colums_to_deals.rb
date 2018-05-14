class AddNewColumsToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :active, :boolean
    add_column :deals, :potential_commission, :decimal
    add_reference :deals, :lead, foreign_key: true
  end
end
