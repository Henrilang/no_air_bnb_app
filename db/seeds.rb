5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create!(
    first_name: first_name,
    last_name: last_name,
    password: "123456",
    email: "#{first_name}_#{last_name}#{rand(67..71)}@gmail.com"
  )
end
8.times do
  Planet.create!(
    name: Faker::Space.unique.planet,
    location: Faker::Space.unique.galaxy,
    user_id: rand(1..5)
  )
end
10.times do
  Booking.create!(
    start_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    end_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    user_id: rand(1..5),
    planet_id: rand(1..8)
  )
end
