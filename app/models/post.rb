class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :property, optional: true
  belongs_to :deal, optional: true
  validates :comment, length: {minimum: 10 }
  validates :rating, inclusion: {in: (1..5).to_a }
  has_and_belongs_to_many :comments
  has_and_belongs_to_many :likes
end
