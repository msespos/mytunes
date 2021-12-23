# frozen_string_literal: true

# Posts controller class
class PostsController < ApplicationController
  def index
    @posts = Post.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    redirect_to posts_path
    flash[:notice] = if @post.save
                       'Post created!'
                     else
                       'Error - could not process post creation'
                     end
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end
end
