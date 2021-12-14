class FriendshipsController < ApplicationController
  def create
    @friend_request = FriendRequest.new(friend_request_params)
    if @friend_request.save
      redirect_to users_index_path
      flash[:notice] = "Friend request created!"
    else
      flash.now[:error] = "Could not create request"
      render action: "new"
    end
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:requesting_user_id, :requested_user_id)
  end
end
