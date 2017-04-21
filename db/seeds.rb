# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

#create users
5.times do
  User.create!(
  #3
  name: RandomData.random_name,
  email: RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

#create topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all



#create posts
50.times do
  #1
  Post.create!(
    user: users.sample,
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

user = User.first
user.update_attributes!(
  email: 'brian@delacruz.com',
  password: 'helloworld'
)

puts "#{Post.count}"
Post.find_or_create_by(title: "A unique title", body: "A unique body")
puts "#{Post.count}"

puts "#{Comment.count}"
Comment.find_or_create_by(body: "What a unique body")
puts "#{Comment.count}"

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

# def unique
#   if post != post.find_or_create_by(title: 'the_one') && post != post.find_or_create_by(body: 'the_body')
#   Post.create! (
#     title: 'the_one'
#     body: 'the_body'
#   )
# end
#
# def unique_comment
#   if post != post.find_or_create_by(body: 'unique_body')
#   Comment.create! (
#     body: 'what_a_bod'
#   )
# end
