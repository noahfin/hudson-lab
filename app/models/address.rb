class Address < ApplicationRecord
  has_and_belongs_to_many :properties
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :deals
    pg_search_scope :search, against: [ :address, :street_num, :strret_name, :county, :state, :country, :postal_code, :city, :suite,],
  using: {tsearch: {dictionary: "english"}},
  associated_against: {contact: :Fulladdress, properties: [:address, :zip_code]},
  ignoring: :accents
end

