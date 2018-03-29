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
User.destroy_all

user_ids = []
user_ids << User.create(name: "Jhon Doe", email: "johndoe@test.com", password: 'secret').id
user_ids << User.create(name: "Jane Roe", email: "janeroe@test.com", password: 'secret').id

p "2 users created"
group_ids = { user_ids[0] => [], user_ids[1] => []}

group_ids[user_ids[0]] << Group.create(name: 'Ulster County', user_id: user_ids[0] ).id
group_ids[user_ids[1]]<< Group.create(name: 'Dutchess County', user_id: user_ids[1] ).id
group_ids[user_ids[0]]<< Group.create(name: 'Westchester County', user_id: user_ids[0] ).id
group_ids[user_ids[1]] << Group.create(name: 'New Leads', user_id: user_ids[1] ).id
group_ids[user_ids[0]] << Group.create(name: 'Invertors', user_id: user_ids[0] ).id
group_ids[user_ids[1]]<< Group.create(name: 'Lawyers', user_id: user_ids[1] ).id


p "#{group_ids.count} created"

group_count = group_ids.length
number_of_contacts = 60
contacts = []

number_of_contacts.times do |i|
 user_id = user_ids[Random.rand(0...2)]
  new_contact = {

    name: Faker::Name.name,
    email: Faker::Internet.email,
    company: Faker::Company.name,
    phone: Faker::PhoneNumber.cell_phone,
    cell: Faker::PhoneNumber.cell_phone,
    address: "#{Faker::Address.street_address} #{Faker::Address.zip} #{Faker::Address.city } #{Faker::Address.state}",
    group_id: group_ids[user_id][Random.rand(0...group_count)],
    user_id: user_id
  }
  contacts.push(new_contact)

end

Contact.create(contacts)
p "#{number_of_contacts} created"

 p Faker::Name.name
