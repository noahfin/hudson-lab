class Company < ApplicationRecord
   has_and_belongs_to_many :address
   has_and_belongs_to_many :contacts
   has_and_belongs_to_many :deals
   has_attached_file :avatar,
  :storage => :s3,
  :styles => {
    thumb: '100x100#',
    square: '200x200>',
    medium: '540x283'
  },
  default_url: "ant-rozetsk.jpg",
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :bucket => 'hudson-lab-images',
  :url => ":s3_domain_url",
  :path => "/:class/avatars/:id_:basename.:style.:extension"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
