class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      redirect_to users_index_path
      destroy_friend_request
      flash[:notice] = "Friendship created!"
    else
      flash.now[:error] = "Could not create friendship"
      render "users/index"
    end
  end

  def create_friend_request
    @friend_request = FriendRequest.new(friend_request_params)
    if @friend_request.save
      redirect_to users_index_path
      flash[:notice] = "Friend request created!"
    else
      flash.now[:error] = "Could not create request"
      render "users/index"
    end
  end

  def destroy_friend_request
    @friend_request = FriendRequest.all.where(
      requesting_user_id: friendship_params[:user1_id],
      requested_user_id: friendship_params[:user2_id])
    id = @friend_request.first.id
    @friend_request.destroy(id)
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user1_id, :user2_id)
  end

  def friend_request_params
    params.require(:friend_request).permit(:requesting_user_id,
                                           :requested_user_id, :id)
  end
end
