class Contact < ApplicationRecord
  require 'roo'
  include ContactsHelper
  has_many :groups
  has_and_belongs_to_many :user
  has_and_belongs_to_many :properties
  has_many :current_users, -> { users }, class_name: 'User'
  validates :name, :email, presence: true
  validates :name, length: { minimum: 2}
  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "100x100>" },
  :s3_credentials => "#{Rails.root}/config/s3.yml",
    :bucket => 'hudson-lab-images',
    :url => ":s3_domain_url",
    :path => "/:class/avatars/:id_:basename.:style.:extension"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  enum role: [:broker, :agent, :owner, :buyer, :lessor, :employee, :management, :peronal, :potential_customer]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :potential_customer

  end

  scope :search, -> (term) do
    where('name like :term or company like :term or email like :term', term: "%#{term.downcase}%") if term.present?

  end


  scope :by_group, -> (group_id) {  current_user.contacts.where(["group_id = ?", group_id ]) if group_id.present?}




def self.inport(file, group, users )
  spreadsheet = Roo::Spreadsheet.open(file.path)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    contact = find_by(id: row["id"]) || new
    row = row.to_hash
    row['group_id'] = group.id
    contact.attributes = row
    contact.save!
    user_reltionships(contact, group, users)
  end
end



  def self.user_reltionships(contact, group, users)
    users.each do |user|
      user = User.find(user.to_i)
      contact_model = ContactsUser.create(contact: contact, user: user)
      group_model = GroupsUser.create(group: group, user: user) unless Group.exists?(user_id: user.id)
    end
  end

    def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
        when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
        when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
        when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
      end
  end
end
