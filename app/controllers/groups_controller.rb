class GroupsController < ApplicationController
  include ContactsHelper

  def create
    @group = Group.new(group_params)
    if @group.save
      params['group']['user_id'].each_with_index do |user, i |
      user = User.find(user.to_i)
      main_model = GroupsUser.create(group: @group, user: user)
      flash[:warring] = "Group user relationships was successfully created."
    end
    render json: @group, status: : created
    else
      render json: @group.errors.full_messages, status: : unprocessable_entity
    end
  end

  private

  def group_params
    params.require(: group).permit(: name, : user_id => [])
  end
end
