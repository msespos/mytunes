# frozen_string_literal: true

# TextPost class
class TextPost < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :post
  has_many :comments, as: :post

  def viewable_by?(current_user)
    user == current_user || current_user.friends.include?(user)
  end

  def number_of_text_likes
    Like.all.where(post_id: id, post_type: "TextPost").count
  end
end
