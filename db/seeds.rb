puts 'Clearing restaurants'
Restaurant.destroy_all
puts 'Restaurants done'

puts 'Clearing reviews'
Review.destroy_all
puts 'Reviews done'

puts 'DB cleared'

puts 'Creating restaurants'

100.times do
  restaurant = Restaurant.create!(
    {
      name: Faker::Restaurant.name,
      address: Faker::Address.street_name,
      phone_number: Faker::PhoneNumber.phone_number,
      category: %w[chinese italian japanese french belgian].sample
    }
  )
  puts "Restaurant #{restaurant.id} created"
end

puts 'Creating reviews'
Restaurant.all.each do |restaurant|
  review = Review.create!(
    rating: rand(1..5),
    content: Faker::Restaurant.review,
    restaurant: restaurant
  )
  puts "Review #{review.id} created"
end

puts 'All done!'
