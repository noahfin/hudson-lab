module TasksHelper
  def task_relationships(contacts, groups, projects, properties, leads)
    if contacts
      contacts = contacts
      contact_array = []
      contacts.each do |contact_id|
      next if contact_id == ""
         if contact_id.to_i > 0
          contact_array.push(contact_id)
             @task.contact_ids = contact_array
          end
       end
     end

     if groups
      groups.each do |group_id|
        next if group_id == 0 || group_id == ''
        group = Group.find(group_id)
          @task.groups << group
      end
     end

     if projects
         @task.project_ids = projects
     end
     if leads
         @task.lead_ids = leads
     end
       if properties
         @task.property_ids = properties
     end
  end
end
