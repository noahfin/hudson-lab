class Contact < ApplicationRecord
  belongs_to :group
  has_and_belongs_to_many :user
  validates :name, :email, :group_id, presence: true
  validates :name, length: { minimum: 2}
  has_attached_file :avatar, styles: { medium: "150x150>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  scope :search, -> (term) do
    where('name like :term or company like :term or email like :term', term: "%#{term.downcase}%") if term.present?

  end
  # def self.search(term)
  #   if term && !term.empty?

  #     where('name like ?', "%#{term}%")
  #   else
  #     all
  #   end
  # end

scope :by_group, -> (group_id) { where(group_id: group_id) if group_id.present?}
  #   def self.by_group(group_id)
  #   if group_id && !group_id.empty?

  #     where(group_id: group_id)
  #   else
  #     all
  #   end
  # end



end
