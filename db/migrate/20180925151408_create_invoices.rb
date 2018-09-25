class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.decimal :sale_price
      t.decimal :lease_price
      t.decimal :commission
      t.string :name

      t.timestamps
    end
  end
end
