# frozen_string_literal: true

class ImagePost < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :post
  has_many :comments, as: :post
  has_one_attached :image
end
