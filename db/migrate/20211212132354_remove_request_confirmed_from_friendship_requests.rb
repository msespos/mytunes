class RemoveRequestConfirmedFromFriendshipRequests < ActiveRecord::Migration[6.1]
  def change
    remove_column :friend_requests, :request_confirmed
  end
end
