class CreateJoinTableInvoicesUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :invoices, :users do |t|
      t.index [:invoice_id, :user_id]
      t.index [:user_id, :invoice_id]
    end
  end
end
