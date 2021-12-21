# frozen_string_literal: true

# Friendships controller
class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      redirect_to users_index_path
      # IS CALLING DESTROY_FRIEND_REQUEST HERE A GOOD IDEA???
      destroy_friend_request
      flash[:notice] = 'Friendship created!'
    else
      flash.now[:error] = 'Could not create friendship'
      # POSSIBLY NOT RENDERING CORRECTLY - POSSIBLE NOMETHODERROR
      # NEED TO CHECK THIS - HOW?
      render 'users/index'
    end
  end

  # SHOULD SOME OF THIS BE MADE MODEL CODE?
  def create_friend_request
    @friend_request = FriendRequest.new(friend_request_params)
    # DOES THIS NEED TO BE DONE WITH "?"s?
    @duplicate_request = FriendRequest.all.where(
      requesting_user_id: friend_request_params[:requesting_user_id],
      requested_user_id: friend_request_params[:requested_user_id]
    )
    # DOES THIS NEED TO BE DONE WITH "?"s?
    @opposite_request = FriendRequest.all.where(
      requesting_user_id: friend_request_params[:requested_user_id],
      requested_user_id: friend_request_params[:requesting_user_id]
    )
    if @duplicate_request.first
      redirect_to users_index_path
      flash[:notice] = "You've already made a friend request to them!"
    elsif @opposite_request.first
      redirect_to users_index_path
      flash[:notice] = "They've already made a friend request to you!"
    elsif @friend_request.save
      redirect_to users_index_path
      flash[:notice] = 'Friend request created!'
    else
      flash.now[:error] = 'Could not create request'
      # POSSIBLY NOT RENDERING CORRECTLY - POSSIBLE NOMETHODERROR
      # NEED TO CHECK THIS - HOW?
      render 'users/index'
    end
  end

  def destroy_friend_request
    # DOES THIS NEED TO BE DONE WITH "?"s?
    # ALSO WHAT ABOUT USING FRIENDSHIP_PARAMS TO DEAL WITH FRIEND_REQUEST?
    # ALSO WhAT ABOUT GRABBING FIRST FRIEND_REQUEST?
    @friend_request = FriendRequest.all.where(
      requesting_user_id: friendship_params[:requesting_user_id],
      requested_user_id: friendship_params[:requested_user_id]
    )
    Rails.logger.debug "@FRIEND_REQUEST: #{@friend_request}"
    id = @friend_request.first.id
    if @friend_request.destroy(id)
      redirect_to users_index_path
      flash[:notice] = 'Friend request denied!'
    else
      flash.now[:error] = 'Could not deny request'
      # POSSIBLY NOT RENDERING CORRECTLY - POSSIBLE NOMETHODERROR
      # NEED TO CHECK THIS - HOW?
      render 'users/index'
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:requesting_user_id, :requested_user_id)
  end

  def friend_request_params
    params.require(:friend_request).permit(:requesting_user_id,
                                           :requested_user_id, :id)
  end
end
