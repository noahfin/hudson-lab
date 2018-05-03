module ContactsHelper
  def user_reltionships(contact)

    err = ''
    if params['contact'][:group_id]
    params['contact'][:group_id].each do |group_id|
       next if group_id == "" || group_id.to_i < 1
    @group = Group.find(group_id)
    group_contact_model = ContactsGroup.update( contact: contact, group: @group)

     @group.contacts << contact
     if params['contact']['user_id']
    users = params['contact']['user_id'].to_a
    users.each do |user|
      next if user == "" ||  user.to_i < 1
      user = User.find(user.to_i)
         group_model = GroupsUser.update(group: @group, user: user)
         contact_model = ContactsUser.create(contact: contact, user: user)
      if group_model.errors.any?
        err += "****" + contact_model.errors.full_messages.to_s
      end
        flash[:warring] = "Group user relationships was successfully created." unless group_model.errors.any?



          flash[:warring] = "Contact user relationships was successfully created." unless contact_model.errors.any?
           end
         end
       end
      end
     end
    end


