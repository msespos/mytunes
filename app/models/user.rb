# frozen_string_literal: true

# User class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :requesting_user_friendships, class_name: 'Friendship',
                                         foreign_key: :requesting_user_id
  has_many :requested_user_friendships, class_name: 'Friendship',
                                        foreign_key: :requested_user_id
  has_many :text_posts
  has_many :likes
  has_many :comments
  has_one_attached :avatar

  validates :name, presence: true

  after_create :send_admin_mail

  def friends
    friendships.map { |friendship| User.find(friend_id(friendship)) }
  end

  def friendships
    Friendship.where('(requested_user_id = ? OR requesting_user_id = ?)
                       AND confirmed = ?', id, id, true)
  end

  def friend_id(friendship)
    friendship.requested_user_id == id ? friendship.requesting_user_id : friendship.requested_user_id
  end

  def friend_requested
    friend_requests.map { |friendship| User.find(friend_id(friendship))  }
  end

  def friend_requests
    Friendship.where('(requested_user_id = ? OR requesting_user_id = ?)
                       AND confirmed = ?', id, id, false)
  end

  def pending_friend_requests_from_others
    Friendship.where('requested_user_id = ? AND confirmed = ?', id, false)
  end

  def pending_friend_requests_to_others
    Friendship.where('requesting_user_id = ? AND confirmed = ?', id, false)
  end

  def neither_friends_nor_friend_requested_nor_self
    User.all - friends - friend_requested - [self]
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Creates users if they don't exist
    user ||= User.create(name: data['name'],
                         email: data['email'],
                         password: Devise.friendly_token[0, 20])
    user
  end

  def send_admin_mail
    UserMailer.welcome_email(self).deliver
  end
end
