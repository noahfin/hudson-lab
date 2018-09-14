module SearchedsHelper

  def searched_shift(searcheds)


        if !params['contact_ids'].nil? && params['contact_ids'].first.to_i > 0
          id_array = []
          contact_id = ''
          contact_id_array = params['contact_ids'].to_a

            contact_id_array.each do |id |
              if id.to_i > 0
               id_array << id
               contact_id = id.to_s
              end
           end
       end

       contact = Contact.find(contact_id)
           searcheds.first.update_attributes(:name => contact.name, :contact_id => contact.id.to_s, :number => contact.phone, :email => contact.email, :cell =>  contact.cell, :fulladdress => contact.Fulladdress)
     searched_id = searcheds.first.id
      @searched = Searched.find searched_id
      contact_ids_array =  convert_to_array(searcheds)
    searcheds.each_with_index do |searched, index |

      next if index == 0
      contact = Contact.find(contact_ids_array[index + 1])
      break if index == 7
            searched.update_attributes(:name => contact.name, :contact_id => contact.id.to_s, :number => contact.phone, :email => contact.email, :cell =>  contact.cell, :fulladdress => contact.Fulladdress)
     end

     return @searched
  end


 def convert_to_array(searcheds)
  array = []
   searcheds.each_with_index do |searched, index |
    array[index] = searched.contact_id
   end
   return array
 end
end
