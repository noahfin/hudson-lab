class User < ApplicationRecord
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :contacts, :through => :groups, :source => :user
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :deals
  has_and_belongs_to_many :teams
  has_many :posts, dependent: :destroy
  has_many :issues, dependent: :destroy
  has_many :posted_properties, through: :posts,  source: :property, dependent: :destroy
  has_many :problem_properties, through: :issues,  source: :property, dependent: :destroy
  has_many :posted_deals, through: :posts,  source: :deal, dependent: :destroy
  has_many :problem_deals, through: :issues,  source: :deal, dependent: :destroy
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id', dependent: :destroy
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id', dependent: :destroy
  has_many :personal_messages, dependent: :destroy
  has_many :account_logins, dependent: :destroy

  enum role: [:user, :customer, :employee, :agent, :broker, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user

  end

  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

end

