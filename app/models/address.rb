class Address < ApplicationRecord
  has_and_belongs_to_many :properties
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :deals

 def self.search(term)
    where('address LIKE ? ', "%#{term}%") if term.present?
  end
end

