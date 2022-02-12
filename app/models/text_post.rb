# frozen_string_literal: true

# TextPost class
class TextPost < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :post
  has_many :comments, as: :post
  include SelectivelyViewable
end
