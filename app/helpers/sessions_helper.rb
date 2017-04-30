module SessionsHelper
  #4
  def create_session(user)
    session[:user_id] = user.id
  end

  #5
  def destroy_session(user)
    session[:user_id] = nil
  end

  #6
  def current_user
    User.find_by(id: session[:user_id])
  end

  def post_author_pic(post)
    author = User.find_by(id: post[:user_id])
    return author.avatar_url(22)
  end

end
