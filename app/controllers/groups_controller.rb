class GroupsController < ApplicationController
  require "csv"
  require 'roo'
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
       respond_to do |format|
        format.html
        format.js
      end
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
    @users = User.all
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    if @group.save



      flash[:info] = "Group with the slected users was successfully created."
    else
       flash[:danger] = @group.errors.full_messages.to_s

    end

    respond_to do |format|
        format.html
        format.js
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
    params.require(:group).permit(:name, :id, :contact_id => [], :user_ids => [])
  end

end
