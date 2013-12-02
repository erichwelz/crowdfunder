# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.destroy_all
Category.destroy_all

10.times do |i|

Project.create({
  title: Faker::Commerce.product_name,
  description: Faker::Lorem.sentence(word_count = 20),
  goal_in_dollars: (rand * 10000).to_i,
  start_date: Date.today,
  finish_date: Date.today + 20,
  owner_id: 1,
  public_date: Date.today + 1

})
end

Category.create({
  category_name: Faker::Lorem.sentence(word_count = 2)
})
