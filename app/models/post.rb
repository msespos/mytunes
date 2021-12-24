# frozen_string_literal: true

# Post class
class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  def display_for?(current_user)
    self.user == current_user || current_user.friends.include?(self.user)
  end

  def can_be_liked_by?(current_user)
    current_user.likes.where(post_id: self.id).empty?
  end

  def number_of_likes
    Like.all.where(post_id: self.id).count
  end
end
