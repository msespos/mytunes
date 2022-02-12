# frozen_string_literal: true

# AudioPost class
class AudioPost < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :post
  has_many :comments, as: :post
  has_one_attached :audio
  include SelectivelyViewable
end
