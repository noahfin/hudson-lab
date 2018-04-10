class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :customer, :employee, :street_name, :street_num, :city, :username, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :employee, :customer, :street_name, :street_num, :city, :username, :password, :password_confirmation, :current_password)
  end
  protected
  def after_sign_up_path_for(resource)
    if curruent_user.customer
      user = User.find(curruent_user.id)
      user.update(roll: 2)
      Customer.create(first_name: curruent_user.first_name, last_name: curruent_user.last_name)
      dashboard_path
    end
  end
  def after_update_path_for(resource)
    dashboard_path
  end
end

