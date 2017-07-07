module PostsHelper
  def user_is_authorized_to_update?(post)
    current_user && (current_user.admin? || current_user.moderator? || current_user == post.user)
  end

  def user_is_authorized_to_delete?(post)
    current_user && (current_user == post.user || current_user.admin?)
  end
end
