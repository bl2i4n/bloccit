require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:topic){create(:topic)}
  let(:user){create(:user)}
  let(:post){create(:post)}
  let(:vote){create(:vote)}

  #1
  it {is_expected.to belong_to(:post)}
  it {is_expected.to belong_to(:user)}
  #2
  it {is_expected.to validate_presence_of(:value)}
  #3
  it {is_expected.to validate_inclusion_of(:value).in_array([-1, 1])}

  describe "update_post callback" do
    it "triggers update_post on save" do
        expect(vote).to receive(:update_post).at_least(:once)
        vote.save!
    end

  end

end
