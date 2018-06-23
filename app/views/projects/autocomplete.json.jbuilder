json.array!(@projects) do |project|
  json.id project.id
  if project.name
     json.value project.name
   end
end
