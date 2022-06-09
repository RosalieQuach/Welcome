# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

puts ("Cleaning up DB")
Post.destroy_all
User.destroy_all
puts ("DB clean")

Category.create({
  name: 'Language',
  icon: 'fa-language'
  })

Category.create({
  name: 'Network',
  icon: 'fa-comments'
  })

Category.create({
  name: 'Sports',
  icon: 'fa-futbol'
  })

Category.create({
  name: 'Job',
  icon: 'fa-briefcase'
  })

Category.create({
  name: 'Family',
  icon: 'fa-child'
  })


50.times do
#   # call the API to get user data
  url = "https://randomuser.me/api/?nat=ch&inc=location,email,phone,picture"
  user_serialized = URI.open(url).read
  user = JSON.parse(user_serialized)
  # actually create a user with this data
  User.create({
    phone: user["results"][0]["phone"],
    email: user["results"][0]["email"],
    password: '123456',
    created_at: Faker::Date.backward(days: 14),
    updated_at: Faker::Date.backward(days: 7),
    location: user["results"][0]["location"]["city"],
    postcode: user["results"][0]["location"]["postcode"],
    streetname: user["results"][0]["location"]["street"]["name"],
    streetnumber: user["results"][0]["location"]["street"]["number"],
    picture: user["results"][0]["picture"]["thumbnail"]
    })
end

50.times do
  Post.create!({title: Faker::Lorem.sentence(word_count: 10),
    category: Category.limit(5).sample,
    description: Faker::Lorem.sentence(word_count: 100),
    is_offer: Faker::Boolean.boolean(true_ratio: 0.2),
    created_at: Faker::Date.backward(days: 14),
    location: ['Zurich', 'Geneva', 'Bern', 'Lausanne', 'Bellinzona'].sample,
    user: User.all.sample})
end
