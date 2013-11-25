# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create! email: "danielles.travels@gmail.com", first_name: "Danielle", last_name: "Van Suchtelen", password: "admin", password_confirmation: "admin"

customer1 = Customer.create! first_name: "bob", last_name: "schmidt", email: "hi@you.com", phone: "303-890-7989", address: "123 You street", city: "Littleton", state: "AZ", zip: 80979
order1 = Order.create! whole_beef: nil, half_beef: nil, qtr_beef: 1, bbq_hog: nil, half_hog: 1, whole_hog: nil, chickens: 5, lamb: nil, bbq_pit: false, comments: "Do you deliver to Colorado springs?", customer_id: 1

