json.extract! issue, :id, :severity, :status, :comment, :user_id, :property_id, :created_at, :updated_at
json.url issue_url(issue, format: :json)
