module SelectivelyViewable
  def viewable_by?(current_user)
    user == current_user || current_user.friends.include?(user)
  end

  def number_of_likes
    likes.count
  end
end
