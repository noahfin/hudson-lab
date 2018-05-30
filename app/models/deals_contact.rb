class DealsContact < ActiveRecord::Base

  belongs_to :contact
  belongs_to :group

end
