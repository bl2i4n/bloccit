require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:post) {Question.create!(title: "New Post Title", body: "New Post Body", resolved: boolean)}
  let(:answer) {Answer.create!(body: 'Comment Body', question: question)}

  describe "attributes" do
    it "has a body attribute and references question" do
      expect(answer).to have_attributes(body: "Comment Body")
    end
  end
end
