json.extract! task, :id, :name, :complete, :created_at, :updated_at
json.url task_url(task, format: :json)
