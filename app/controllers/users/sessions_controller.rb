module Users
  class SessionsController < Devise::SessionsController
   def new
     self.resource = resource_class.new(sign_in_params)
     store_location_for(resource, params[:redirect_to])
      self.update_attribute(:last_seen_at, Time.current)
     super
   end
  end
end
