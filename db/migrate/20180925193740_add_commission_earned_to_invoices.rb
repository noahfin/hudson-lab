class AddCommissionEarnedToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :Commission_Earned, :decimal
  end
end
