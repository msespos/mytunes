# frozen_string_literal: true

# User class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user1_friendships, class_name: 'Friendship', foreign_key: :user1_id
  has_many :user2_friendships, class_name: 'Friendship', foreign_key: :user2_id
  has_many :requesting_user_friend_requests, class_name: 'FriendRequest',
                                             foreign_key: :requesting_user_id
  has_many :requested_user_friend_requests, class_name: 'FriendRequest',
                                            foreign_key: :requested_user_id

  def friendships
    Friendship.where('user1_id = ? OR user2_id = ?', id, id)
  end

  def pending_friend_requests
    FriendRequest.where('requesting_user_id = ?', id)
  end

  # NEED TO REFACTOR THIS?
  def friends
    friends = []
    user1_friends = Friendship.where('user2_id = ?', id)
    user1_friends.each do |f|
      friends << User.find(f.user1_id)
    end
    user2_friends = Friendship.where('user1_id = ?', id)
    user2_friends.each do |f|
      friends << User.find(f.user2_id)
    end
    friends
  end
end
