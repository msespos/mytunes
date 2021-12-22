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

  def friendships
    Friendship.where('requesting_user_id = ? OR requested_user_id = ?', id, id)
  end

  def pending_friend_requests
    Friendship.where('requested_user_id = ? AND confirmed = ?', id, false)
  end

  # NEED TO RENAME THIS?
  def self.dont_show_friend_request_link?(current_user, u)
    current_user.friends.include?(u) ||
      u.pending_friends.include?(current_user) ||
      current_user.pending_friends.include?(u)
  end

  # NEED TO REFACTOR THIS?
  def pending_friends
    pending_friends = []
    requesting_user_friends = Friendship.where('requested_user_id = ?
                                                AND confirmed = ?', id, false)
    requesting_user_friends.each do |f|
      pending_friends << User.find(f.requesting_user_id)
    end
    pending_friends
  end

  # NEED TO REFACTOR THIS?
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
end
