json.array!(@addresses) do |address|
  json.id address.id
  json.value address.address
end
