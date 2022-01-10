# frozen_string_literal: true

# TextPost class
class TextPost < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :post
  has_many :comments

  def viewable_by?(current_user)
    user == current_user || current_user.friends.include?(user)
  end

  def number_of_likes
    Like.all.where(post_id: id).count
  end
end
