module DealsHelper
  def deal_reltionships(deal)
    if  params['user_ids'] != nil && deal.users.nil?
      users = params['contact']['user_id'].to_a
      users.each do |user|
        next if user == "" ||  user.to_i < 1
        user = User.find(user.to_i)
        contact_model = DealsUser.create(contact: contact, user: user) unless ContactsUser.where(contact: contact, user: user).exists?
       end
     end
     if params['contact_ids'] != nil && deal.contacts.nil?
        contacts = params['contact_ids'].to_a
        contacts.each do |contact|
        next if contact == "" || contact.to_i < 1
        contact_model = DealsContact.create(deal: deal, contact: contact) unless DealsContact.where(deal: deal, contact: contact).exists?
      end
    end
  end
end
