module SelectivelyViewable
  def viewable_by?(current_user)
    user == current_user || current_user.friends.include?(user)
  end

  def number_of_likes(post_type)
    Like.all.where(post_id: id, post_type: post_type).count
  end
end
