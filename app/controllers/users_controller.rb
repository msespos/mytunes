# frozen_string_literal: true

# Users Controller class
class UsersController < ApplicationController
  def index
    # IS CREATING @USERS AND @FRIEND_REQUESTS IN TWO DIFFERENT CONTROLLERS OK?
    @users = User.all
    @friend_requests = FriendRequest.where('requested_user_id = ?', current_user.id)
  end
end
