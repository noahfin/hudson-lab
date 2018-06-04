class Task < ApplicationRecord
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :users
  has_and_belongs_to_many :properties
  has_and_belongs_to_many :deals
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :teams
  has_and_belongs_to_many :leads

end
