class CreateJoinTableInvoicesDeals < ActiveRecord::Migration[5.2]
  def change
    create_join_table :invoices, :deals do |t|
      t.index [:invoice_id, :deal_id]
      t.index [:deal_id, :invoice_id]
    end
  end
end
