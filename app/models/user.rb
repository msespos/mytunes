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

  def pending_friend_requests
    Friendship.includes(:requesting_user).where('requested_user_id = ?
                                                AND confirmed = ?', id, false)
  end

  def can_friend_request?(user)
    Friendship.where('requested_user_id = ? AND requesting_user_id = ?
                     OR requested_user_id = ? AND requesting_user_id = ?',
                     id, user.id, user.id, id).empty?
  end

  def friend_requesting?(user)
    Friendship.where('requested_user_id = ? AND requesting_user_id = ?
                      AND confirmed = ?', user.id, id, false).present?
  end

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

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    user ||= User.create(name: data['name'],
                         email: data['email'],
                         password: Devise.friendly_token[0, 20])
    user
  end

  def send_admin_mail
    UserMailer.welcome_email(self).deliver
  end
end
