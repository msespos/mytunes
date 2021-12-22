# frozen_string_literal: true

# Users Controller class
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @friendships = current_user.friendships
  end
end
