# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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

20.times do
  User.create({
    email: Faker::Internet.email,
    password: '123456',
    nickname: Faker::Games::Pokemon.name,
    created_at: Faker::Date.backward(days: 14),
    updated_at: Faker::Date.backward(days: 7),
    location: ['Zurich', 'Geneva', 'Bern', 'Lausanne', 'Bellinzona'].sample
              })
end

20.times do
  Post.create!({title: Faker::Lorem.sentence(word_count: 10),
    category: Category.all.sample,
    description: Faker::Lorem.sentence(word_count: 100),
    user_id: Faker::IDNumber.valid,
    is_offer: Faker::Boolean.boolean(true_ratio: 0.2),
    created_at: Faker::Date.backward(days: 14),
    location: ['Zurich', 'Geneva', 'Bern', 'Lausanne', 'Bellinzona'].sample,
    user: User.all.sample})
end
