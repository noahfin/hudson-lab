json.array!(@properties) do |property|
  json.id property.id
  if property.name
     json.value property.name
   end
end
