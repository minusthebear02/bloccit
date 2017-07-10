module UsersHelper
  def written_posts_yet?
    current_user && current_user.posts.count != 0
  end

  def written_comments_yet?
    current_user && current_user.comments.count != 0
  end

  def favorited_posts_yet?
    current_user && current_user.favorites.count != 0
  end
end
