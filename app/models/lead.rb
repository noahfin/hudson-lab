class Lead < ApplicationRecord
  belongs_to :contact, optional: true
  belongs_to :property, optional: true
  self.inheritance_column = :_type_disabled
end
