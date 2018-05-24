class Task < ApplicationRecord
  has_and_belongs_to_many :contacts, optional: true
  has_and_belongs_to_many :users, optional: true
  has_and_belongs_to_many :properties, optional: true
end
