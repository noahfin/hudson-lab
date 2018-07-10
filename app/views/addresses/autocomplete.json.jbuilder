json.array!(@addresses) do |address|
  json.id address.id
  json.number address.address
end
