class Searched < ApplicationRecord
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :users
end
