# frozen_string_literal: true

# Users Controller class
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    posts = TextPost.all + ImagePost.all + AudioPost.all
    @viewable_posts = posts.sort { |x, y| y.created_at <=> x.created_at }.select do |p|
      p.user == current_user
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You updated your profile!'
      redirect_to user_path
    else
      flash[:notice] = 'Error - could not process profile update'
      render 'edit'
    end
  end

  def user_params
    params.require(:user).permit(:name, :project_name, :location,
                                 :favorite_artist, :birthday, :avatar)
  end
end
