class ContactsUser < ActiveRecord::Base
  belongs_to :contact, optional: true
  belongs_to :user, optional: true
end
