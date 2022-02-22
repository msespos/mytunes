# frozen_string_literal: true

# Friendships controller
class FriendshipsController < ApplicationController
  def show
    @friends = current_user.friends
  end

  def create
    if current_user.request_friendship_with(friendship_params)
      flash[:notice] = 'You made a friendship request!'
    else
      flash[:alert] = 'Error - could not process friend request'
    end
    redirect_to users_index_path
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.requested_user_id = current_user.id
    if @friendship.destroy
      flash[:notice] = 'You denied the friendship request!'
      redirect_to users_index_path
    else
      flash[:alert] = 'Error - could not process friend denial'
      render 'index'
    end
  end

  def confirm
    @friendship = Friendship.find(params[:id])
    @friendship.confirmed = true
    @friendship.requested_user_id = current_user.id
    if @friendship.save
      flash[:notice] = 'You confirmed the friendship!'
      redirect_to users_index_path
    else
      flash[:alert] = 'Error - could not process confirmation'
      render 'index'
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:requested_user_id, :confirmed)
  end
end
