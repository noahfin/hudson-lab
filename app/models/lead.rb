class Lead < ApplicationRecord
  belongs_to :contact, optional: true
  belongs_to :property, optional: true
  has_and_belongs_to_many :tasks
  self.inheritance_column = :_type_disabled
end
