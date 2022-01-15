# frozen_string_literal: true

class AudioPost < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :post
  has_many :comments, as: :post
  has_one_attached :sound

  def viewable_by?(current_user)
    user == current_user || current_user.friends.include?(user)
  end

  def number_of_audio_likes
    Like.all.where(post_id: id, post_type: 'AudioPost').count
  end
end
