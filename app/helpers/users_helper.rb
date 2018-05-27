module UsersHelper
  def group_share(user, groups)

    err = ''
    if  !user.nil? && !groups.nil?
      group_ids = groups
      if group_ids[1].to_i > 0 || group_ids[0] != ''
       user.group_ids = group_id
     end

      groups_with_contacts = []

      group_ids.each do |group_id|
        contacts = Group.find(group_id).contacts.to_a
        groups_with_contacts.push(contacts)
      end


      groups_with_contacts.each do |group|
        group.each do |contact|
          next if contact.nil?
          contact_model = ContactsUser.create(contact: contact, user: user) unless ContactsUser.where(contact: contact, user: user).exists?
        end
      end
    else
        flash[:danger] = "missing selected groups or user to share with"
    end

  end
end



