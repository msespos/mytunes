# frozen_string_literal: true

# Users Controller class
class UsersController < ApplicationController
  def index
    @users = User.all
  end
end
