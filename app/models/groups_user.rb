class GroupsUser < ActiveRecord::Base
  belongs_to :user, optional: true
  belongs_to :group, optional: true
end
