# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
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

puts "done"
puts "Creating categories"
User.find_each do |user|
  2.times do
    Category.create!(
      name: categories.sample,
      description: Faker::Games::LeagueOfLegends.unique.quote,
      price: rand(1000..10000),
      user: user
      )
  end
end


puts "done"

