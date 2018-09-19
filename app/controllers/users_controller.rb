class UsersController < ApplicationController
    include UsersHelper
    before_action :authenticate_user!
   # before_action :admin_only, :except => :show

  def index
    @users = User.all


  end
 def sharegroups
      admin_only
      if params['option']
        if params['option'] == "Share with selected"
         user_to_share_with = User.find params['user']['user_id']

         if params['groups'] && params['user']['user_id']

          group_share(user_to_share_with,   params['groups'])
           flash[:success] = "The selected Groups and Contacts where successfully shared"
         else
           flash[:danger] = "Error the selected Groups where not able to be shared"
         end

        elsif params['option'] = "Remove form selected"
           flash[:info] = "This function is still in the procces of being built"
        end
     end
    render 'index'
 end

  def show
    @user = User.find(params[:id])
    # if current_user.id !=  params[:id]
    #  @user == current_user
    #     redirect_to root_path, :alert => "Access denied or routing error."
    #   end

  end

  def update
     if params['option']
      sharegroups
      else
        @user = User.find(params[:id])
        if @user.update_attributes(secure_params)
          redirect_to users_path, :notice => "User updated."
        else
          redirect_to users_path, :alert => "Unable to update user."
        end
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



  def set_theme

  current_user.update_attributes :theme => params[:theme] unless params[:theme].nil? || params[:theme] == ""

  end

  private

  def admin_only
    unless current_user.admin?
      flash[:danger] = "Access denied! You need to be login as Admin"
      redirect_to root_path
    end
  end

  def secure_params
    params.require(:user).permit(:first_name, :last_name, :email, :group,  :customer, :employee, :theme, :role, :street_name, :street_num, :city, :username, :password, :password_confirmation)

  end


end
