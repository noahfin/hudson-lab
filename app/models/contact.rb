class Contact < ApplicationRecord
  belongs_to :group
  # paginates_per 10
end
