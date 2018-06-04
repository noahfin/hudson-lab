class Project < ApplicationRecord
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :teams
  accepts_nested_attributes_for :tasks
  accepts_nested_attributes_for :teams
end
