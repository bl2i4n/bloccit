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

  def show
    #19
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    #9
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @topic = Topic.find(params[:topic_id])
    #35
    @post.topic = @topic

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
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

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
end
