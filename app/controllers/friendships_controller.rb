# frozen_string_literal: true

# Friendships controller
class FriendshipsController < ApplicationController
  def show
    @friends = current_user.friends
  end

  def create
    @friendship = Friendship.new(friendship_params)
    flash[:notice] = if @friendship.save
                       'You made a friendship request!'
                     else
                       'Error - could not process friend request'
                     end
    redirect_to users_index_path
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    if @friendship.destroy
      flash[:notice] = 'You denied the friendship request!'
      redirect_to users_index_path
    else
      flash[:notice] = 'Error - could not process friend denial'
      render 'index'
    end
  end

  def confirm
    @friendship = Friendship.find(params[:id])
    @friendship.confirmed = true
    return unless current_user.id == @friendship.requested_user_id

    if @friendship.save
      flash[:notice] = 'You confirmed the friendship!'
      redirect_to users_index_path
    else
      flash[:notice] = 'Error - could not process confirmation'
      render 'index'
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:requesting_user_id, :requested_user_id,
                                       :confirmed)
  end
end
