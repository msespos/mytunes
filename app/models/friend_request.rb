class FriendRequest < ApplicationRecord
  belongs_to :requesting_user, class_name: 'User'
  belongs_to :requested_user, class_name: 'User'
end
