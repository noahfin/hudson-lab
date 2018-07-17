module ContactsHelper
  def user_reltionships(contact)

    if  params['contact'][:group_id] != nil
    group_id = params['contact'][:group_id]
    contact.group_ids = group_id
    end

    if  params['contact']['user_id'] != nil
    users = params['contact']['user_id'].to_a
    contact.user_ids = users

    end
  end
end



