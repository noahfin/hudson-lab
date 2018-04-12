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
user_array = []
user_ids = []
user_array[0] = User.create(name: "Jhon Doe", email: "noahhudsoncommercial.com", password: 'secret')
user_ids << user_array[0].id
user_array[1] = User.create(name: "Jane Roe", email: "nonothetoad@gmail.com", password: 'secret')
user_ids << user_array[1].id
p "2 users created"
group_ids = { user_ids[0] => [], user_ids[1] => []}

group_ids[user_ids[0]] << Group.create(name: 'Ulster County', user_id: user_ids[0] ).id
group_ids[user_ids[1]] << Group.create(name: 'Dutchess County', user_id: user_ids[1] ).id
group_ids[user_ids[0]] << Group.create(name: 'Westchester County', user_id: user_ids[0] ).id
group_ids[user_ids[1]] << Group.create(name: 'New Leads', user_id: user_ids[1] ).id
group_ids[user_ids[0]] << Group.create(name: 'Invertors', user_id: user_ids[0] ).id
group_ids[user_ids[1]] << Group.create(name: 'Lawyers', user_id: user_ids[1] ).id


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

 property_array = []
 property_array[0] = Property.create(name: '2622 South Ave', code: '26SA', category: 'office')
 property_array[1] = Property.create(name: '235 Main Street', code: '23MS', category: 'office')
 property_array[2] = Property.create(name: 'Medical Arts Building ', code: '19BA', category: 'Medical office')
 property_array[3] = Property.create(name: '1970 Route 9W ', code: '199W', category: 'Warehouse')
 deal_array = []
deal_array[0] = Deal.create(name: 'SRI', code: 'sri1', category: 'Warhouse for sale')
deal_array[1] = Deal.create(name: 'Quality Glass Works', code: 'QGW1', category: 'Warhouse for lease')

posts = []
number_of_contacts.times do |i|
 user_id = user_ids[Random.rand(0...2)]
 property_id =  property_array[Random.rand(0...4)]
 deal_id = deal_array[Random.rand(0...2)]

  new_post = {

    user: user_id,
    property: property_id,
    deal: deal_id,
    rating: Random.rand(1...6),
    comment: Faker::ChuckNorris.fact

  }
  posts.push(new_post)

end


