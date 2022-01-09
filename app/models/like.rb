# frozen_string_literal: true

# Like class
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :text_post
end
