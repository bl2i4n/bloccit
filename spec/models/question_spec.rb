require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.create!(title: "New Question Title", body: "New Post Body", resolved: boolean)}

  describe "attributes" do
    it "has a body attribute" do
      expect(question).to have_attributes(body: "Comment Body")
    end

    it "has a boolean attribute" do
      expect(question).to have_attributes(resolved: boolean)
    end

  end
end
