require 'rails_helper'

RSpec.describe Advertisement, type: :model do

  #refactor to have title body and price
  let(:post) { Post.create!(title:"New Post Title", body:"New Post Body") }

  # describe "attributes" do
  #   it "has title and body attributes" do
  #     expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
  #   end
  # end

end
