# frozen_string_literal: true

# AudioPosts Controller class
class AudioPostsController < ApplicationController
  def new
    @audio_post = AudioPost.new
  end

  def create
    @audio_post = AudioPost.new(audio_post_params)
    @audio_post.user_id = current_user.id
    if @audio_post.save
      flash[:notice] = 'Post created!'
      redirect_to posts_path
    else
      flash[:notice] = 'Error - could not process post creation'
      render 'new'
    end
  end

  private

  def audio_post_params
    params.require(:audio_post).permit(:sound)
  end
end
