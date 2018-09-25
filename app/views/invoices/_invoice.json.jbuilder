json.extract! invoice, :id, :sale_price, :lease_price, :commision, :name, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
