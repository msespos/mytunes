# frozen_string_literal: true

# Post class
class Post < ApplicationRecord
  belongs_to :user
end
