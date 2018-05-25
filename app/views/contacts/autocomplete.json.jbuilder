json.array!(@contacts) do |contact|
  json.id contact.id
  if contact.name
     json.value contact.name

  else
     json.value contact.first_name + ' ' + contact.last_name
   end
end
