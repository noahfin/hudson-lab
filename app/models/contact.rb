class Contact < ApplicationRecord
  require 'roo'
  include PgSearch
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

 pg_search_scope :search, against: [:name, :first_name, :last_name, :company, :email]
 pg_search_scope :by_county, against: [:county]
  def set_default_role
    self.role ||= :potential_customer

  end

  def self.search(term)

    where('name LIKE ? or first_name LIKE ? or last_name LIKE ? or company LIKE ? or email LIKE ?', "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%") if term.present?


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
    groups = groups.to_a

      if groups[1].to_i > 0 || groups[0] != ''
       contact.group_ids =  groups
      end
     if  groups != nil?
       users = users.to_a
       users.each do |user|
        next if user == "" ||  user.nil?
        user = User.find(user)
           contact_model = ContactsUser.create(contact: contact, user: user) unless ContactsUser.where(contact: contact, user: user).exists?
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
