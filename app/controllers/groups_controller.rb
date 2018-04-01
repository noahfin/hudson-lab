class GroupsController < ApplicationController
 include ContactsHelper
  def create

   @group =  Group.new(group_params)

    if @group.save
      user_reltionships( @group ,"group", params['group']['user_id'])
      render json: @group, status: :created
    else
      render json: @group.errors.full_messages, status: :unprocessable_entity
    end
  end

private


  def group_params
    params.require(:group).permit(:name, :user_id => [])
  end
end


