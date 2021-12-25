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

  def like
    @like = Like.new(like_params)
    redirect_to posts_path
    flash[:notice] = if @like.save
                       'You liked a post!'
                     else
                       'Error - could not process like'
                     end
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end
