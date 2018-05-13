json.extract! lead, :id, :name, :business, :address, :email, :date, :phone, :number, :size_requirement, :location_need, :time_requirement, :notes, :contact_id, :property_id, :created_at, :updated_at
json.url lead_url(lead, format: :json)
