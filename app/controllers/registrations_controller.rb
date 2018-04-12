class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :customer, :employee, :role, :street_name, :street_num, :city, :username, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :employee, :customer, :role, :street_name, :street_num, :city, :username, :password, :password_confirmation, :current_password)
  end
  protected

  def after_update_path_for(resource)
    dashboard_path
  end
end

