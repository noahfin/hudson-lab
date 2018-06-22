json.array!(@groups) do |group|
  json.id group.id
  if group.name
     json.value group.name
   end
end
