class User < ApplicationRecord
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :contacts, :through => :groups, :source => :user
  has_and_belongs_to_many :tasks
  has_many :posts
  has_many :issues
  has_many :posted_properties, through: :posts,  source: :property
  has_many :problem_properties, through: :issues,  source: :property
  has_many :posted_deals, through: :posts,  source: :deal
  has_many :problem_deals, through: :issues,  source: :deal
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  has_many :personal_messages, dependent: :destroy
  enum role: [:user, :customer, :employee, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user

  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
