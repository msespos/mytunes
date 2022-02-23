# frozen_string_literal: true

# rubocop: disable Metrics/AbcSize
# rubocop: disable Metrics/MethodLength

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
    if current_user.id != @friendship.requested_user_id
      flash[:alert] = 'Error - could not process confirmation'
      Rails.logger.debug "Warning - Hack attempt - User tried to destroy a friendship that isn't theirs"
      redirect_to users_index_path
    elsif @friendship.destroy
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
    if current_user.id != @friendship.requested_user_id
      flash[:alert] = 'Error - could not process confirmation'
      Rails.logger.debug 'Warning - Hack attempt - User tried to hijack friendship'
      redirect_to users_index_path
    elsif @friendship.save
      flash[:notice] = "You are now friends with #{@friendship.requesting_user.name}!"
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

# rubocop: enable Metrics/MethodLength
# rubocop: enable Metrics/AbcSize
