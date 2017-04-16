# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

#create topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

#create sponsored posts
50.times do
  SponsoredPost.create!(
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  price: 20,
  topic: topics.sample
  )
end



#create posts
50.times do
  #1
  Post.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph

  )
end
posts = Post.all

#create comments
#3
100.times do
  Comment.create!(
    #4
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "#{Post.count}"
Post.find_or_create_by(title: "A unique title", body: "A unique body")
puts "#{Post.count}"

puts "#{Comment.count}"
Comment.find_or_create_by(body: "What a unique body")
puts "#{Comment.count}"

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{SponsoredPost.count} sponsored posts created"
