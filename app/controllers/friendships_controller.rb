# frozen_string_literal: true

# Friendships controller
class FriendshipsController < ApplicationController
  def index
    @users = User.all
    @friendships = Friendship.where('requested_user_id = ?', current_user.id)
  end

  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      redirect_to users_index_path
      flash[:notice] = 'You made a friendship request!'
    else
      flash.now[:error] = 'Error - could not process friend request'
      # NEED TO TEST THAT IS RENDERING CORRECTLY WHEN ERROR
      render 'users/index'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    if @friendship.destroy
      redirect_to users_index_path
      flash[:notice] = 'You denied the friendship request!'
    else
      flash.now[:error] = 'Error - could not process friend request'
      # NEED TO TEST THAT IS RENDERING CORRECTLY WHEN ERROR
      render 'users/index'
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:requesting_user_id, :requested_user_id,
                                       :confirmed)
  end
end
