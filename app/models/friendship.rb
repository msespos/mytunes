# frozen_string_literal: true

# Friendship class
class Friendship < ApplicationRecord
  belongs_to :requesting_user, class_name: 'User'
  belongs_to :requested_user, class_name: 'User'
end
