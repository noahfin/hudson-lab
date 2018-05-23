class GroupsController < ApplicationController
  require "csv"
  require 'roo'
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show
    respond_to do |format|
    format.html
    format.csv { send_data @group.to_csv(@group.contacts) }
    format.xls
    end
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      params['group']['user_id'].each_with_index do |user, i |
       next if user == "" ||  user.to_i < 1
       next if !User.exists?(:id => user)
      @user = User.find(user.to_i)
      main_model = GroupsUser.create(group: @group, user: @user)
      flash[:warring] = "Group user relationships was successfully created."
    end
      render json: @group, status: :created
    else
      render json: @group.errors.full_messages, status:  :unprocessable_entity
    end

  end

  def update
    @group.update_attribute(:name, params['group']['name'])
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
    params.require(:group).permit(:name,  :contact_id => [], :user_id => [])
  end

end
