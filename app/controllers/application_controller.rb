class ApplicationController < ActionController::Base
  include HomeHelper
  include Pundit
  protect_from_forgery with: :exception
  before_action :public_profile
  helper_method :previous_query_string
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_groups
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :show_404

   def previous_query_string
    if params[:group_id]
       session[:selected_group_id] = params[:group_id]
    end
    session[:selected_group_id] ? {group_id: session[:selected_group_id]} : {}
  end

  def public_profile
    if current_user
      @theme = 'default'
      user = User.find(current_user.id) # profile's owner
      @theme ||= user.theme # overriding default theme to custom one
    end
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path

  end

    def after_sign_up_path_for(resource)
      after_sign_in_path_for(resource)
      store_login_time
    end

  private

  def user_not_authorized
    flash[:danger] = "You are not authorized to perform this action"
    redirect_to action: index
  end

  def show_404
    render template: "errors/404", status: 404 if current_user
  end

  protected


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :last_name, :employee, :customer, :street_name, :street_num, :city, :username, :email, :password, :password_confirmation, :last_seen_at, :account_logins])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :first_name, :last_name, :employee, :customer, :street_name, :street_num, :city, :username, :email, :password, :password_confirmation, :last_seen_at, :account_logins])
  end
  def get_groups
    @groups = current_user.groups.order('name ASC').uniq if current_user
    @contacts = current_user.contacts.order('last_name ASC').page(params[:page]) if current_user
    @users = User.all
    @search = Search.new
  end

end
