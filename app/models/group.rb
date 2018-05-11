class Group < ApplicationRecord
  require 'roo'
  require 'csv'
   has_and_belongs_to_many :contacts
   has_and_belongs_to_many :users

   validates :name, presence: true
   validates :name, uniqueness: true


 def to_csv(contacts, options = {})
  CSV.generate(options) do |csv|
    csv << Contact.column_names
    contacts.each do |contact|

      h = {:id=> contact.id.to_s,
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
 :type=> contact.type.to_s,
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
 :grand_total=>contact.street_num.to_s,
 :city=> contact.city.to_s,
 :state=> contact.state.to_s,
 :county=>contact.county.to_s,
 :country=> contact.country.to_s,
 :postal_code=>contact.postal_code.to_s
}
       csv << h.values

    end
  end
end
end


