# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin1 = Admin.create! email: "danielles.travels@gmail.com", first_name: "Danielle", last_name: "Van Suchtelen", password: "admin", password_confirmation: "admin", 