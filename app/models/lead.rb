class Lead < ApplicationRecord
  belongs_to :contact, optional: true
  belongs_to :property, optional: true
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :deals
  self.inheritance_column = :_type_disabled
end
