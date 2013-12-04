# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.destroy_all
Category.destroy_all
User.destroy_all

user1 = User.create!({
  email: "test@test.ca",
  first_name: "test",
  last_name: "test",
  password: "test",
  password_confirmation: "test"
  }
)

user2 = User.create!({
  email: "pat@gmail.com",
  first_name: "pat",
  last_name: "hann",
  password: "pat",
  password_confirmation: "pat"
  }
)

user3 = User.create!({
  email: "nothing@gmail.com",
  first_name: "nothing",
  last_name: "project",
  password: "nothing",
  password_confirmation: "nothing"
  }
)

user4 = User.create!({
  email: "user4@gmail.com",
  first_name: "user4",
  last_name: "user4",
  password: "user4",
  password_confirmation: "user4"
  }
)

5.times do |i|
Category.create({
  category_name: Faker::Lorem.sentence(word_count = 2)
})
end

category_ids = Category.all.map{|c| c.id}


10.times do |i|

Project.create({
  title: "Scumbag's " + Faker::Commerce.product_name,
  description: Faker::Lorem.sentence(word_count = 20),
  goal_in_dollars: (rand * 10000).to_i,
  owner_id: user1.id,
  start_date: Date.today,
  finish_date: Date.today + 21 + (rand * 30).to_i,
  public_date: Date.today - 15 + (rand * 30).to_i,
  category_id: category_ids.sample
})
end

10.times do |i|

Project.create({
  title: "Pat's " + Faker::Commerce.product_name,
  description: Faker::Lorem.sentence(word_count = 20),
  goal_in_dollars: (rand * 10000).to_i,
  owner_id: user2.id,
  start_date: Date.today,
  finish_date: Date.today + 21 + (rand * 30).to_i,
  public_date: Date.today - 15 + (rand * 30).to_i,
  category_id: category_ids.sample
})
end

10.times do |i|

Project.create({
  title: "User4's " + Faker::Commerce.product_name,
  description: Faker::Lorem.sentence(word_count = 20),
  goal_in_dollars: (rand * 10000).to_i,
  owner_id: user4.id,
  start_date: Date.today,
  finish_date: Date.today + 21 + (rand * 30).to_i,
  public_date: Date.today - 15 + (rand * 30).to_i,
  category_id: category_ids.sample
})
end

