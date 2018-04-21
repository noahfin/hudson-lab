class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show

  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    if @group.save
      params['group']['user_id'].each_with_index do |user, i |
      user = User.find(user.to_i)
      main_model = GroupsUser.create(group: @group, user: user)
      flash[:warring] = "Group user relationships was successfully created."
    end

      render json: @group, status: :created
    else
      render json: @group.errors.full_messages, status:  :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :user_id => [])
  end
  def update
     if @group.update(group_params)
      params['group']['user_id'].each_with_index do |user, i |
       user = User.find(user.to_i)
       main_model = GroupsUser.update(group: @group, user: user)
      end
      flash[:warring] = "Group user relationships was successfully created."
      flash[:info] = "Group was successfully updated."
      redirect_to group_path(@group)

    else
      flash[:info] = "Error group was not successfully updated."
      redirect_to edit_group_path(@group)
    end

  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def group_params
    params.require(:group).permit(:name, :user_id => [], :contact_id)
  end

end
