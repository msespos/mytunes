# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user1_friendships, class_name: 'Friendship', foreign_key: :user1_id
  has_many :user2_friendships, class_name: 'Friendship', foreign_key: :user2_id

  def friendships
    Friendship.where("user1_id = ? OR user2_id = ?", self.id, self.id)
  end
end
