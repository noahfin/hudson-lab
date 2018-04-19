class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :admin_only, :except => :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if params[:id].is_an_integer? @user == current_user
     @user == current_user
        redirect_to root_path, :alert => "Access denied or routing error."
      end

  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
  def create
    @user = User.new(secure_params)
    if @user.save
      redirect_to users_path, :notice => "User Created."
    else
      redirect_to users_path, :alert => "Unable to create user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:first_name, :last_name, :email, :customer, :employee, :role, :street_name, :street_num, :city, :username, :password, :password_confirmation)

  end


end
