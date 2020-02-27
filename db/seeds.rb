# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"
puts "Destroying everything"
Category.destroy_all
User.destroy_all
gender = ["male", "female"]
categories = ["Grandpa", "Teenager", "Child", "Family", "Univerity", "Father", "Mother", "Brother", "Sister"]
personality = ["movie", "reading", "chatting", "walk", "sightsee", "eating", "skiing", "sleeping", "scubadiving", "extreme sports", "cooking", "drinking" ]

puts "creating users"
15.times do
  User.create!(
    first_name: Faker::Games::Pokemon.unique.name,
    last_name: Faker::Games::SuperSmashBros.unique.fighter,
    location: Faker::Games::Pokemon.unique.location,
    gender: gender.sample,
    age: rand(10..80),
    personality: personality.sample,
    active: true,
    email: Faker::Internet.email,
    password: "123456"
    )
end

urls = {
  "Grandpa" => ['https://www.thewrap.com/wp-content/uploads/2017/12/AngryGrandpa.jpg'],
   "Teenager" => ['https://i.pinimg.com/236x/46/57/10/4657106f6fefc3bfaa0ad6f5954844ac--in-style-gangsters.jpg', 'https://i.pinimg.com/736x/4e/b1/a3/4eb1a3940ed31d8751adf8b5efdb6a2b.jpg'],
   "Child" => ['https://cdn.cdnparenting.com/articles/2018/01/209117488-H.jpg', 'https://lgbtqnation-assets.imgix.net/2019/09/twins.jpg?w=790&h=530&fit=crop&auto=format&auto=compress&crop=faces'],
   "Family" => ['https://www.rebuckandassociates.com/sites/rebuckandassociates.com/files/styles/medium/public/young-family_0.jpg?itok=y9LXOlfQ', 'https://media.beliefnet.com/~/media/photos-with-attribution/family/family-parenting-kids-baby-happy_credit-shutterstock.jpg'],
   "Univerity" => ['https://i.pinimg.com/originals/50/3f/72/503f7261e848bf5780acf7cd655617b1.jpg', 'https://akns-images.eonline.com/eol_images/Entire_Site/2010419/425.fox.megan.lc.051910.jpg?fit=inside|900:auto&output-quality=90'],
   "Father" => ['https://express-images.franklymedia.com/6616/sites/1446/2019/08/30074236/Craig-Morgan-NCD.jpg'],
   "Mother" => ['https://img.freepik.com/free-photo/happy-mother-baby-posing_23-2148354782.jpg?size=626&ext=jpg'],
   "Brother" => ['https://i.pinimg.com/originals/78/b0/1d/78b01dd3497c7db3a96c28a780827358.jpg'],
   "Sister" => ['https://i.pinimg.com/originals/af/ea/b4/afeab4d00ea4758d11248eaa6ce5e170.jpg']
}

puts "done"
puts "Creating categories"
User.find_each do |user|
  2.times do
    category_name = categories.sample
    url = urls[category_name].sample
    p url
    file = URI.open(url)
    category = Category.create!(
      name: category_name,
      description: Faker::Games::LeagueOfLegends.unique.quote,
      price: rand(1000..10000),
      user: user
      )
    category.photo.attach(io: file, filename: "#{category_name}.jpg", content_type: 'image/jpg')
    category.save!
  end
end


puts "done"

