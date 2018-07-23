module ContactsHelper
  def user_reltionships(contact)
    if  params['contact'][:group_id] || params['group_ids']
      if  params['contact'][:group_id] != nil
        group_id = params['contact'][:group_id]
        contact.group_ids = group_id
     elsif params['group_ids'] != nil
        group_id =  params['group_ids']
        contact.group_ids = group_id
      end
    end
    if  params['contact']['user_id'] || params['user_ids']
      if  params['contact']['user_id'] != nil
       users = params['contact']['user_id'].to_a
       contact.user_ids = users
     elsif  params['user_ids'] != nil
        users = params['user_ids'].to_a
        contact.user_ids = users
      end
    end
  end
end
