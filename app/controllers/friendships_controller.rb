# frozen_string_literal: true

# Friendships controller
class FriendshipsController < ApplicationController
  def index
    @users = User.all
    @friendships = Friendship.where('requested_user_id = ?', current_user.id)
  end

  def show
    @friends = current_user.friends
  end

  def create
    @friendship = Friendship.new(friendship_params)
    redirect_to users_index_path
    flash[:notice] = if @friendship.save
                       'You made a friendship request!'
                     else
                       'Error - could not process friend request'
                     end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    redirect_to users_index_path
    flash[:notice] = if @friendship.destroy
                       'You denied the friendship request!'
                     else
                       'Error - could not process friend denial'
                     end
  end

  def confirm
    @friendship = Friendship.find(params[:id])
    @friendship.confirmed = true
    redirect_to users_index_path
    flash[:notice] = if @friendship.save
                       'You confirmed the friendship!'
                     else
                       'Error - could not process confirmation'
                     end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:requesting_user_id, :requested_user_id,
                                       :confirmed)
  end
end
