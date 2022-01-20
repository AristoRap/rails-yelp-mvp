puts 'Clearing db'

Restaurant.destroy_all

puts 'db cleared'

puts 'Creating restaurants'

100.times do
  restaurant = Restaurant.create(
    {
      name: Faker::Restaurant.name,
      address: Faker::Address.street_name,
      phone_number: Faker::PhoneNumber.phone_number,
      category: %w[chinese italian japanese french belgian].sample
    }
  )
  puts "Restaurant #{restaurant.id} created"
end
