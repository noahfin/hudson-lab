json.array!(@deals) do |deal|
  json.id deal.id
  if deal.name
     json.value deal.name
   end
end
