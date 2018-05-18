json.array!(@contacts) do |contact|
  json.id contact.id
  if contact.first_name
  json.value contact.first_name + ' ' + contact.last_name
  else
     json.value contact.name
   end
end
