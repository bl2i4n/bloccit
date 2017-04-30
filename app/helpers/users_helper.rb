module UsersHelper
  def count_posts(user)
    if @user.posts.count == 0
      return "No posts found for #{user.name}."
    else
      render @user.posts
    end
  end

  def count_comments(user)
    if @user.comments.count == 0
      return "No comments found for #{user.name}."
    else
      render @user.comments
    end
  end

  def show_favs
    if @user.favorites.count == 0
      return "#{user.name} has no favorites"
    else
      render @user.favorites.map(&:post)
    end
  end
end
