require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  #8
  let(:my_post) {Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}

  #6
  describe "GET #index" do
    it "returns http success" do
  #7
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_post] to @posts" do
        get :index
      #9
        expect(assigns(:posts)).to eq([my_post])
    end
  end

  #1
  describe "GET new" do
  it "returns http success" do
    get :new
    expect(response).to have_http_status(:success)
  end

  #2
  it "renders the #new view" do
    get :new
    expect(response).to render_template :new
  end

  #3
  it "instantiates @post" do
    get :new
    expect(assigns(:post)).not_to be_nil
  end
end

  describe "POST create" do
    #4
    it "increases the number of Post by 1" do
      expect{post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
    end

    #5
    it "assigns the new post to @post" do
      post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:post)).to eq Post.last
    end

    #6
    it "redirects to the new post" do
      post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to Post.last
    end

end
end
