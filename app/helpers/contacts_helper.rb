module ContactsHelper
  def user_reltionships(contact)

    err = ''
    if  params['contact'][:group_id] != nil
    group_id = params['contact'][:group_id] if params['contact'][:group_id]
    if group_id[1].to_i > 0 || group_id[0] != ''


     contact.group_ids = params['contact'][:group_id]
       end
  end

     if  params['contact'][:group_id] != nil
     if params['contact']['user_id'] &&  params['contact']['user_id'][0] != nil

      users = params['contact']['user_id'].to_a

    users.each do |user|
      next if user == "" ||  user.to_i < 1
      user = User.find(user.to_i)

         contact_model = ContactsUser.create(contact: contact, user: user) unless ContactsUser.where(contact: contact, user: user).exists?


           end
          end
         end

      end
     end



