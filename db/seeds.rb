# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

#create posts
50.times do
  #1
  Post.create!(
    #2
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

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

def unique
  if post != post.find_or_create_by(title: 'the_one') && post != post.find_or_create_by(body: 'the_body')
  Post.create! (
    title: 'the_one'
    body: 'the_body'
  )
end

def unique_comment
  if post != post.find_or_create_by(body: 'unique_body')
  Comment.create! (
    body: 'what_a_bod'
  )
end
