# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(firstname: "Example",
              lastname: "User",
              email: "exampleuser@sfu.ca",
              password: "foobar",
              password_confirmation: "foobar",
              admin: true,
              activated: true,
              activated_at: Time.zone.now)

99.times do |n|
  firstname  = Faker::Name.name
  lastname  = Faker::Name.name
  email = "example-#{n+1}@sfu.ca"
  password = "password"
  User.create!(firstname:  firstname,
              lastname: lastname,
              email: email,
              password:              password,
              password_confirmation: password,
              admin: false,
              activated: true,
              activated_at: Time.zone.now)
end
