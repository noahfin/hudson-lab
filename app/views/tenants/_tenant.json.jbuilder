json.extract! tenant, :id, :company_name, :notes, :created_at, :updated_at
json.url tenant_url(tenant, format: :json)
