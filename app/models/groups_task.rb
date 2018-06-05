class GroupsTask < ActiveRecord::Base
  belongs_to :task
  belongs_to :group
end
