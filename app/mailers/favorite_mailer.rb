class FavoriteMailer < ApplicationMailer
  default from: "briandelacruz408@gmail.com"

  def new_comment(user, post, comment)
    #18
    headers["Message-ID"] = "<comments/#{comment.id}@stark-garden-85510.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@stark-garden-85510.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@stark-garden-85510.herokuapp.com>"

    @user = user
    @post = post
    @comment = comment

    #19
    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(post)
    headers["Message-ID"] = "<posts/#{post.id}@stark-garden-85510.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@stark-garden-85510.herokuapp.com>"
    headers["References"] = "<post/#{post.id}@stark-garden-85510.herokuapp.com>"

    @post = post

    mail(to: post.user.email, subject: "You're following, #{post.title}")
  end

end
