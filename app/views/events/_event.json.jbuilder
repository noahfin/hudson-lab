json.extract! event, :id, :title, :description, :notification, :category, :attended, :created_at, :updated_at
json.url event_url(event, format: :json)
