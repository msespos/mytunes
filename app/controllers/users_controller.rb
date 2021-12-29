# frozen_string_literal: true

# Users Controller class
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_index_path
      flash[:notice] = 'You updated your profile!'
    else
      flash[:notice] = 'Error - could not process profile update'
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :project_name, :location,
                                 :favorite_artist, :birthday)
  end
end
