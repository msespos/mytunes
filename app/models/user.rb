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

  def friends
    friendships.map { |f| User.find(friend_id(f)) }
  end

  def friendships
    Friendship.where('(requested_user_id = ? OR requesting_user_id = ?)
                       AND confirmed = ?', id, id, true)
  end

  def friend_id(f)
    f.requested_user_id == id ? f.requesting_user_id : f.requested_user_id
  end
end
