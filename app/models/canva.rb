class Canva < ApplicationRecord
  has_and_belongs_to_many :cancontacts
  has_and_belongs_to_many :contacts
end
