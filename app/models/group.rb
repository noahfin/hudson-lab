class Group < ApplicationRecord
   has_many :contacts
  has_and_belongs_to_many :user

   validates :name, presence: true
   validates :name, uniqueness: true


end
