# frozen_string_literal: true

# Post class
class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  def display_post?(current_user)
    self.user == current_user || current_user.friends.include?(self.user)
  end
end
