# frozen_string_literal: true

# Post class
class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def viewable_by?(current_user)
    user == current_user || current_user.friends.include?(user)
  end

  def number_of_likes
    Like.all.where(post_id: id).count
  end
end
