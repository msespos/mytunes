# frozen_string_literal: true

# rubocop: disable Metrics/AbcSize

# Users Controller class
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    posts = TextPost.includes(:user).all +
            ImagePost.includes(:user).all +
            AudioPost.includes(:user).all
    @viewable_posts = posts.sort { |x, y| y.created_at <=> x.created_at }.select do |p|
      p.user == @user
    end
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

# rubocop: enable Metrics/AbcSize
