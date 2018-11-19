class Group < ApplicationRecord
  require 'roo'
  require 'csv'
   has_and_belongs_to_many :contacts
   has_and_belongs_to_many :users
   has_and_belongs_to_many :tasks
   has_and_belongs_to_many :categories


   validates :name, presence: true
   validates :name, uniqueness: true

  def self.search(term)
    where('name LIKE ? ', "%#{term}%") if term.present?
  end

 def to_csv(contacts, options = {})
  CSV.generate(options) do |csv|

      header = {
  :id=> "Id",
  :name=> "Name",
 :prefix=> "Prefix",
 :first_name=> "First Name",
 :middle_name=> "Middle Name",
 :last_name=> "Last Name",
 :suffix=> "Suffix",
 :postion=> "Position",
 :web_address=> "Web Address",
 :latitude=> "Latitude",
 :longitude=> "Longitude",
 :facility_size=> "Facility Size",
 :total_number_of_employees=> "Total Number Of Employees",
 :primary_industry=> "Primary Industry",
 :year_of_Founding=>  "Year Of Founding",
 :owns_cents=> "Owns Rents",
 :email=> "Email",
 :company=>  "Company",
 :phone=>  "Phone",
 :Fulladdress=>  "Full Address",
 :street_num => "Street Number",
 :strret_name => "Street Name",
 :city=> "City",
 :state=> "State",
 :county=> "County",
 :country=> "Country",
 :postal_code=> "Postal Code",
 :zip_code_ext=> "Zip Code Ext"
}
    csv << header.values
    contacts.each do |contact|

      h = {
 :id=> contact.id.to_s,
 :name=> contact.name.to_s,
 :prefix=> contact.prefix.to_s,
 :first_name=> contact.first_name.to_s,
 :middle_name=> contact.middle_name.to_s,
 :last_name=> contact.last_name.to_s,
 :suffix=> contact.suffix.to_s,
 :postion=> contact.postion.to_s,
 :web_address=> contact.web_address.to_s,
 :latitude=>contact.latitude.to_s,
 :longitude=> contact.longitude.to_s,
 :facility_size=>contact.facility_size,
 :total_number_of_employees=>contact.total_number_of_employees.to_s,
 :primary_industry=>contact.primary_industry.to_s,
 :year_of_Founding=> contact.year_of_Founding.to_s,
 :owns_cents=>contact.owns_cents.to_s,
 :email=> contact.email.to_s,
 :company=> contact.company.to_s,
 :phone=> contact.phone.to_s,
 :address=> contact.address.to_s,
 :street_num=>contact.street_num.to_s,
 :strret_name=>contact.strret_name.to_s,
 :city=> contact.city.to_s,
 :state=> contact.state.to_s,
 :county=>contact.county.to_s,
 :country=> contact.country.to_s,
 :postal_code=>contact.postal_code.to_s,
  :zip_code_ext=> contact.zip_code_ext.to_s
}
       csv << h.values

    end
  end
end
end


