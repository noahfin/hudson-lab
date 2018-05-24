class ContactsGroup < ActiveRecord::Base

  belongs_to :contact, optional: true
  belongs_to :group, optional: true

end
