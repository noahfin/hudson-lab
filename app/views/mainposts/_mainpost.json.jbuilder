json.extract! mainpost, :id, :body, :created_at, :updated_at
json.url mainpost_url(mainpost, format: :json)
