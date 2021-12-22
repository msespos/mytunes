# frozen_string_literal: true

# Friendships controller
class FriendshipsController < ApplicationController
  def index
    @users = User.all
    @friendships = Friendship.where('requested_user_id = ?', current_user.id)
  end

  def show
    @friendships = current_user.friends
  end

  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      redirect_to users_index_path
      flash[:notice] = 'You made a friendship request!'
    else
      redirect_to users_index_path
      flash[:notice] = 'Error - could not process friend request'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    if @friendship.destroy
      redirect_to users_index_path
      flash[:notice] = 'You denied the friendship request!'
    else
      redirect_to users_index_path
      flash[:notice] = 'Error - could not process friend denial'
    end
  end

  def confirm
    @friendship = Friendship.find(params[:id])
    @friendship.confirmed = true
    if @friendship.save
      redirect_to users_index_path
      flash[:notice] = 'You confirmed the friendship!'
    else
      redirect_to users_index_path
      flash[:notice] = 'Error - could not process confirmation'
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:requesting_user_id, :requested_user_id,
                                       :confirmed)
  end
end
