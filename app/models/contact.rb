class Contact < ApplicationRecord
  require 'roo'
  include PgSearch
  include ContactsHelper
  after_save :concat_full_name
  self.inheritance_column = :_type_disabled
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :user
  has_and_belongs_to_many :properties
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :deals
  has_and_belongs_to_many :address
  has_and_belongs_to_many :leads
  has_and_belongs_to_many :cancontacts
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
  pg_search_scope :search, against: [:name, :first_name, :last_name, :company, :email],
  using: {tsearch: {dictionary: "english"}},
  associated_against: {group: :name, comments: [:name, :content]},
  ignoring: :accents
  pg_search_scope :by_county, against: [:county]

 pg_search_scope :in_group, against: [:name, :first_name, :last_name, :company, :email]

  def set_default_role
    self.role ||= :potential_customer
  end

  def self.search(term)
    where('name LIKE ? or first_name LIKE ? or last_name LIKE ? or company LIKE ? or email LIKE ?', "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%") if term.present?
  end

def self.good_search(criteria)
  criteria = criteria.split.map(&:capitalize).join(' ')
  where("first_name LIKE ? or name LIKE ?", "%#{criteria}%",  "%#{criteria}%").limit(30) if criteria.present?
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
      if Address.exists?([' city LIKE ? and street_num LIKE ? and strret_name  LIKE ?', "%#{contact.city}%", "%#{contact.street_num}%", "%#{contact.strret_name}%"])
        contact.address_ids << Address.where([' city LIKE ? and street_num LIKE ? and strret_name  LIKE ?', "%#{contact.city}%", "%#{contact.street_num}%", "%#{contact.strret_name}%"])
        else
          Address.create(address: contact.Fulladdress, suite: contact.suite, county: contact.county, state: contact.state, country: contact.country, postal_code: contact.suite, zip_code_ext: contact.zip_code_ext,  city: contact.city, street_num: contact.street_num, strret_name: contact.strret_name)
        end
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
  private
  def concat_full_name
     if self.last_name && self.first_name
      fullname = self.last_name + " " + self.first_name
       self.name = fullname
     end
  end
end
