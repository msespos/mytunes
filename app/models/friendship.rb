# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :requesting_user, class_name: 'User'
  belongs_to :requested_user, class_name: 'User'

  def self.request_friendship(friendship_params)
    @friendship = Friendship.new(friendship_params)
    @friendship.confirmed = false
    @friendship.save
  end
end
