class CreateJoinTableInvoicesContacts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :invoices, :contacts do |t|
      t.index [:invoice_id, :contact_id]
      t.index [:contact_id, :invoice_id]
    end
  end
end
