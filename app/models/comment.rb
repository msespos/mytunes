# frozen_string_literal: true

# Comment class
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :text_post, polymorphic: true
end
