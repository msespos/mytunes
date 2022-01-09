# frozen_string_literal: true

# TextPost class
class TextPost < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def viewable_by?(current_user)
    user == current_user || current_user.friends.include?(user)
  end

  def number_of_likes
    Like.all.where(text_post_id: id).count
  end
end
