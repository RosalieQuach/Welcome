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

# Category.create({
#   name: 'Language',
#   icon: 'fa-language'
#   })

# Category.create({
#   name: 'Network',
#   icon: 'fa-comments'
#   })

# Category.create({
#   name: 'Sports',
#   icon: 'fa-futbol'
#   })

# Category.create({
#   name: 'Job',
#   icon: 'fa-briefcase'
#   })

# Category.create({
#   name: 'Family',
#   icon: 'fa-child'
#   })


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

# 50.times do
#   Post.create!({title: Faker::Lorem.sentence(word_count: 10),
#     category: Category.limit(5).sample,
#     description: Faker::Lorem.sentence(word_count: 100),
#     is_offer: Faker::Boolean.boolean(true_ratio: 0.2),
#     created_at: Faker::Date.backward(days: 14),
#     user: User.all.sample})
# end

Post.create!({title: "I am looking for a German language tandem partner",
  category_id: 1,
  description: "I am from Eritrea and started German language school. I am looking for someone I could meet and practice on a daily basis. I would be happy for any recommendation or advice.",
  is_offer: false,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "I would like to connect with someone from the area for exchange",
  category_id: 2,
  description: "I am a trained nurse and just arrived with my 2 kids from Ukraine. I would like to find other Ukrainian families in the area or also just connect with locals families. I am also looking for a way to engage as a nurse or maybe translater to help other refugees arriving here.",
  is_offer: false,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "Looking for a soccer club to a 6y old kid from Ukraine (free of charge)",
  category_id: 3,
  description: "Hi, my family currently hosts a mother with one child from Ukraine. They are looking for a sports group (preferred soccer) closeby where the boy could join free of charge and connect with other kids. Does anyone have a recommendation, thanks for contacting me through mail or phoen.",
  is_offer: false,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "Looking for an appartment for a refugee family from Eritrea",
  category_id: 3,
  description: "We are currently looking to rent an appartment for a refugee family from Eritrea. Please contact us in case you know someone that can provide.",
  is_offer: false,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "I am looking for an internship, I started studying computer science in Syria",
  category_id: 4,
  description: "I have been here in Switzerland for 3 years and studied computer science back in Syria, I am going back to school now and would be interested to become a web dev. It would be good if I could practice while doing an internship. Can someone recommend or advice? Many thanks.",
  is_offer: false,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "I used to be a primary school teacher in Kiev and would like to assist",
  category_id: 4,
  description: "I  arrived in Switzerland with my 2 daughters 3 months ago and would like to somehow get engaged. I used to be a primary school teacher and would like perhpas to assist teaching Ukrainian kids. Does someone know who I should contact?",
  is_offer: false,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "I am hosting a Ukrainian family and they look for other families from Ukrain in the neighborhood",
  category_id: 5,
  description: "Does someone know other Ukrainian families in the area? We host a family and they are looking to connect with others in the neighborhood. Would be grateful for feedback. Thanks!",
  is_offer: false,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "I would like to offer assistance for translation in case needed, I can speak Ukrainian",
  category_id: 1,
  description: "I can speak Ukrainian and would like to support in case needed (translation of documents, going to the commune, etc.",
  is_offer: true,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "Weekly international café to exchange",
  category_id: 2,
  description: "This coffee get-together gives refugees as well as host families and host families and people interested in Ukraine in general a platform to exchange ideas, to get to know each other and to develop common ideas. Interpreter available. ",
  is_offer: true,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "Clothes fundus",
  category_id: 2,
  description: "In case of urgent need for clothes (especially children's clothes) the local school has a stock of clothes at your disposal available ",
  is_offer: true,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "Prayer for peace offered by the church",
  category_id: 2,
  description: "We offer a public prayer for people in Ukraine, Wednesday evenings at 18:15h. Alternating between reformed and catholic church. ",
  is_offer: true,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "Parents meet-up",
  category_id: 2,
  description: "We offer a meetup: Parents with children aged 0-5 years. The parents can while the children play together and enjoy a play together and enjoy a snack.",
  is_offer: true,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "We are a Kungfu school in the area and are open to take on refugee kids",
  category_id: 3,
  description: "Come and train Kungfu with us. We are open to take on refugee kids free of charge.",
  is_offer: true,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "Outdoor yoga classes (kids and refugees welcome - free of charge)",
  category_id: 3,
  description: "I am a yoga teacher and will offer summer outdoor classes in the park. Please feel free to reach out to me. Kids and refugees can come free of charge. Check my website for more details www.yoga-outdoor.ch.",
  is_offer: true,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "Company in gardening looking for apprentice",
  category_id: 4,
  description: "We are a local gardener company and will be able to take on 2 apprentices from autumn on. If someone is interested please reach out by phone or send us your CV through mail. We are open to also grant the apprenticeship to a refugee.",
  is_offer: true,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})

Post.create!({title: "We offer a lunch for kids on Wednesdays",
  category_id: 5,
  description: "Our school offers a open free lunch for kids on Wednesdays. If someone is interested please reach out to me for more details.",
  is_offer: true,
  created_at: Faker::Date.backward(days: 14),
  user: User.all.sample})
