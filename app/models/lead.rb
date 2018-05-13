class Lead < ApplicationRecord
  belongs_to :contact
  belongs_to :property
end
