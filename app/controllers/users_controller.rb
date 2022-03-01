# frozen_string_literal: true

# Users Controller class
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @viewable_posts = @user.get_recent_posts_for_profile(10)
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You updated your profile!'
      redirect_to user_path
    else
      flash[:alert] = @user.errors.full_messages[0]
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:name, :project_name, :location,
                                 :favorite_artist, :birthday, :avatar)
  end
end
