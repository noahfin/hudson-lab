class Contact < ApplicationRecord
  require 'roo'
  include ContactsHelper
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :user
  has_and_belongs_to_many :properties
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many  :contact_touches, class_name: 'Touch'
  has_many :leads
  has_many :current_users, -> { users }, class_name: 'User'
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
def self.search(search)
  search_condition = "%" + search + "%"
  where("name LIKE ? OR first_name LIKE ? OR last_name LIKE ?", search_condition, search_condition, search_condition)
end


  scope :by_group, -> (group_id) {  current_user.contacts.where(["group_id = ?", group_id ]) if group_id.present?}

   def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |product|
      csv << product.attributes
    end
  end
end


def self.inport(file, group, users )
  spreadsheet = Roo::Spreadsheet.open(file.path)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    contact = find_by(id: row["id"]) || new
    row = row.to_hash
    contact.attributes = row
    contact.save!
    user_reltionships(contact, group, users)
  end
end



  def self.user_reltionships(contact, groups, users)
    if groups
    groups.each do |group_id|
       next if group_id == "" || group_id.to_i < 1
    @group = Group.find(group_id)
    group_contact_model = ContactsGroup.create( contact: contact, group: @group)

     @group.contacts << contact
   end
 end
    users.each do |user|
      user = User.find(user.to_i)
      contact_model = ContactsUser.create(contact: contact, user: user)
      if groups
        groups.each do |group_id|
         next if group_id == "" || group_id.to_i < 1
         group = Group.find(group_id)
         group_model = GroupsUser.create(group: group, user: user) unless Group.exists?(user_id: user.id)
        end
     end
    end
  end

    def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
        when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
        when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
        when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
        when ".numbers" then Roo::Number.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
      end
  end
end
