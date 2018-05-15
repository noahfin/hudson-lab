module ContactsHelper
  def user_reltionships(contact)

    err = ''
    if params['contact'][:group_id]


     contact.group_ids = params['contact'][:group_id]
       end

     if params['contact']['user_id']
    users = params['contact']['user_id'].to_a

    users.each do |user|
      next if user == "" ||  user.to_i < 1
      user = User.find(user.to_i)

         contact_model = ContactsUser.create(contact: contact, user: user) unless ContactsUser.where(contact: contact, user: user).exists?


           end
         end

      end
     end



