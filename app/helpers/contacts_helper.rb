module ContactsHelper
  def user_reltionships(contact)

    err = ''
    @group = Group.find(params['contact'][:group_id])
    users = params['contact']['user_id'].to_a
    users.each do |user|
      next if user.to_i < 1
      user = User.find(user.to_i)
         group_model = GroupsUser.create(group: @group, user: user) unless Group.exists?(user_id: user.id)
      if group_model.errors.any?
        err += "****" + contact_model.errors.full_messages.to_s
      end
        flash[:warring] = "Group user relationships was successfully created." unless group_model.errors.any?


              contact_model = ContactsUser.create(contact: contact, user: user)
              flash[:warring] = "Contact user relationships was successfully created." unless contact_model.errors.any?
      end

      end
    end


