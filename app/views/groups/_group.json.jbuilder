json.extract! group, :id, :name, :created_at, :updated_at
json.url group_url(group, format: :json)
json.array!(@groups) do |group|
  json.id group.id
  json.value group.name
end
