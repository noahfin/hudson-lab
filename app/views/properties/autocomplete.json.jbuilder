json.array!(@properties) do |property|
  json.id property.id
  if property.name
     json.value property.name
   else
     json.value property.Fulladdress
   end
end

