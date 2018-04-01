module ContactsHelper
    def user_reltionships(obj,type, users)




         error_msg = ''

         users.each_with_index do |user, i|
          next if user = ""
          user = User.find(user)

          if type == "group"

            main_model = GroupsUser.create(group: obj, user: user)

           elsif type == "contacts"

             main_model = ContactsUser.create(contact: obj, user: user)

            end
            if main_model.errors.any?
              error_msg += ' ' + main_model.errors.full_messages.to_s
              end

            if error_msg.length > 2
            flash[:danger] = main_model.errors.full_messages.to_s
            else
          flash[:warring] =   type +" user relationships was successfully created."
         end

      end

  end


end
