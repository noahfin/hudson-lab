class Lead < ApplicationRecord
  belongs_to :contact, optional: true
  belongs_to :property, optional: true
end
