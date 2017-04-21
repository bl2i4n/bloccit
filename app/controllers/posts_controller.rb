class PostsController < ApplicationController
  # def index
  #   #11
  #   @posts = Post.all
  #   @posts.each_with_index do |post, index|
  #     if index % 5 == 0
  #       post.title = "SPAM"
  #     end
  #   end
  # end

  before_action :require_sign_in, except: :show
  #10
  before_action :authorize_user, except: [:show, :new, :create]

  def show
    #19
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user

    #10
    if @post.save
      #11
      flash[:notice] = "Post was saved."
      #36
      redirect_to [@topic, @post]
    else
      #12
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)

    if @post.save
      flash[:notice] = "Post was updated."
      #37
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving post. Please try again"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    # 8
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      #38
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end
  #add private methods at the bottom of the file, anything below is private
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_user
    post = Post.find(params[:id])
    #11
    unless current_user == post.user || current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to [post.topic, post]
    end
  end

end
