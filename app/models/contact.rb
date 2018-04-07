class Contact < ApplicationRecord
  include ContactsHelper
  has_many :groups
  has_and_belongs_to_many :user

  has_many :current_users, -> { users }, class_name: 'User'
  validates :name, :email, presence: true
  validates :name, length: { minimum: 2}
  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  scope :search, -> (term) do
    where('name like :term or company like :term or email like :term', term: "%#{term.downcase}%") if term.present?

  end


  scope :by_group, -> (group_id) {  current_user.contacts.where(["group_id = ?", group_id ]) if group_id.present?}


def self.inport(file, group, users )
  CSV.foreach(file.path, headers: true) do |row|
  conatcts = row.to_hash
  conatcts['group_id'] = group.id
  contact = Contact.create!(conatcts)
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
end
