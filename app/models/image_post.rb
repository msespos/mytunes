# frozen_string_literal: true

# ImagePost class
class ImagePost < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :post
  has_many :comments, as: :post
  has_one_attached :image
  include SelectivelyViewable
end
