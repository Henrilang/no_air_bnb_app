# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  Planet.create(
    name: Faker::Company.name,
    location: Faker::Address.street_address,
    user_id: 1
  )
  puts "planet"
end

10.times do
  Booking.create(
    start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    end_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    user_id: 1,
    planet_id: rand(1..10)
  )
  puts "booking"
end
