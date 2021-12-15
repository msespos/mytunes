# frozen_string_literal: true

# Users Controller class
class UsersController < ApplicationController
  def index
    @users = User.all
    @friend_requests = FriendRequest.where('requested_user_id = ?', current_user.id)
  end
end
