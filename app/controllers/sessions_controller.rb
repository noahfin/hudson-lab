
  class SessionsController < Devise::SessionsController
   def new
     self.resource = resource_class.new(sign_in_params)
     store_location_for(resource, params[:redirect_to])
      if current_user
       user = User.find(current_user.id)
       user.update_attribute(:last_seen_at, Time.current)
      end
     super
   end
  end

