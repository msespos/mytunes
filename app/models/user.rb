# frozen_string_literal: true

# User class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requesting_user_friendships, class_name: 'Friendship',
                                         foreign_key: :requesting_user_id
  has_many :requested_user_friendships, class_name: 'Friendship',
                                        foreign_key: :requested_user_id
  has_many :posts
  has_many :likes
  has_many :comments

  def pending_friend_requests
    Friendship.where('requested_user_id = ? AND confirmed = ?', id, false)
  end

  def can_friend_request?(user)
    Friendship.where('requested_user_id = ?
                      OR requesting_user_id = ?', user.id, user.id).empty?
  end

  def pending_friends
    pending_friends = []
    requesting_user_friends = Friendship.where('requested_user_id = ?
                                                AND confirmed = ?', id, false)
    requesting_user_friends.each do |f|
      pending_friends << User.find(f.requesting_user_id)
    end
    pending_friends
  end

  # rubocop:disable Metrics/MethodLength

  def friends
    friends = []
    requesting_user_friends = Friendship.where('requested_user_id = ?
                                                AND confirmed = ?', id, true)
    requesting_user_friends.each do |f|
      friends << User.find(f.requesting_user_id)
    end
    requested_user_friends = Friendship.where('requesting_user_id = ?
                                               AND confirmed = ?', id, true)
    requested_user_friends.each do |f|
      friends << User.find(f.requested_user_id)
    end
    friends
  end

  # rubocop:enable Metrics/MethodLength
end
