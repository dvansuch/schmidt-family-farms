# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create! email: "danielles.travels@gmail.com", first_name: "Danielle", last_name: "Van Suchtelen", password: "admin", password_confirmation: "admin"
Admin.create! email: "schmidtfarms2009@gmail.com", first_name: "Bobby", last_name: "Schmidt", password: "farm1234", password_confirmation: "farm1234"

customer1 = Customer.create! first_name: "Bob", last_name: "Schmidt", email: "hi@you.com", phone: "303-890-7989", address: "123 You street", city: "Littleton", state: "AZ", zip: 80979