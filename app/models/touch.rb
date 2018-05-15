class Touch < ApplicationRecord
   has_and_belongs_to_many  :contacts
end
