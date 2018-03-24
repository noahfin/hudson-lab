# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file .env file.

require 'faker'

Group.destroy_all
Contact.destroy_all

group_ids = []
group_ids << Group.create(name: 'Ulster County').id
group_ids << Group.create(name: 'Dutchess County').id
group_ids << Group.create(name: 'Westchester County').id
group_ids << Group.create(name: 'New Leads').id
group_ids << Group.create(name: 'Invertors').id
group_ids << Group.create(name: 'Lawyers').id


p "#{group_ids.count} created"

group_count = group_ids.length
number_of_contacts = 20
contacts = []

number_of_contacts.times do |i|
  new_contact = {

    name: Faker::Name.name,
    email: Faker::Internet.email,
    company: Faker::Company.name,
    phone: Faker::PhoneNumber.cell_phone,
    cell: Faker::PhoneNumber.cell_phone,
    address: "#{Faker::Address.street_address} #{Faker::Address.zip} #{Faker::Address.city } #{Faker::Address.state}",
    group_id: group_ids[Random.rand(0...group_count)]
  }
  contacts.push(new_contact)

end

Contact.create(contacts)
p "#{number_of_contacts} created"

 p Faker::Name.name
