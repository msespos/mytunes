# frozen_string_literal: true

# Likes controller
class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    redirect_to posts_path
    flash[:notice] = if @like.save
                       'You liked a post!'
                     else
                       'Error - could not process like'
                     end
  end

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
