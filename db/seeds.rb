# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

50.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create!(
    first_name: first_name,
    last_name: last_name,
    password: "password1",
    email: "#{first_name}_#{last_name}#{rand(67..71)}@gmail.com"
  )
  puts "planet"
end

8.times do
  Planet.create!(
    name: Faker::Space.unique.planet,
    location: Faker::Space.unique.galaxy,
    user_id: rand(1..50)
  )
end

50.times do
  Booking.create!(
    start_date: Faker::Date.between(from: '2022-02-27', to: '2022-03-05'),
    end_date: Faker::Date.between(from: '2022-03-06', to: '2022-05-20'),
    user_id: rand(1..50),
    planet_id: rand(1..8)
  )
  puts "booking"
end
