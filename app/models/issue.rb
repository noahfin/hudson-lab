class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :deal
  validates :comment, length: {minimum: 20 }
  validates :status, inclusion: { in: %w(REPORTED INVESTIGATED FIX_IN_PROGRESS FIXED), message: "%{value} is not a valid severity level"}
  validates :severity, inclusion: {in: %(COSMETIC MINOR MAJOR CRITICAL), message: %w(COSMETIC MINOR MAJOR CRITICAL), message: "%{value} is not a valid severity level"}
end
