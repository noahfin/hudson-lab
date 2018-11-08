class GroupsController < ApplicationController
  before_action :authenticate_user!
  require "csv"
  require 'roo'
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all.order(:name)
       respond_to do |format|
        format.html
        format.js
      end
  end

  def autocomplete
       @groups = Group.search(params[:term])
  end

  def show
    session[:return_to] = request.referer
    respond_to do |format|
    format.html
    format.csv { send_data @group.to_csv(@group.contacts) }
    format.xls
    format.js
    end
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def edit
  end


  def create
   @group = Group.new(group_params)
    if @group.save
      flash[:info] = "Group with the slected users was successfully created."
     render json: @group, status: :created
    end
  end

  def update
     if  @group.update(group_params)
          flash[:info] = "Group with the slected users was successfully updated."
    else
       flash[:danger] = @group.errors.full_messages.to_s
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end
  def group_params
    params.require(:group).permit(:name, :id, :touch_ids, :contact_id => [], :user_ids => [])
  end

end
