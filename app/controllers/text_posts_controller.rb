# frozen_string_literal: true

# TextPosts controller class
class TextPostsController < ApplicationController
  def new
    @text_post = TextPost.new
  end

  def create
    @text_post = TextPost.new(text_post_params)
    @text_post.user_id = current_user.id
    if @text_post.save
      flash[:notice] = 'Post created!'
      redirect_to posts_path
    else
      flash[:alert] = 'Error - could not process post creation'
      render 'new'
    end
  end

  private

  def text_post_params
    params.require(:text_post).permit(:body)
  end
end
