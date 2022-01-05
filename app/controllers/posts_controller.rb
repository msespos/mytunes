# frozen_string_literal: true

# Posts controller class
class PostsController < ApplicationController
  def index
    @viewable_posts = Post.order('created_at DESC').select do |p|
      p.viewable_by?(current_user)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
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

  def comment
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    redirect_to posts_path
    flash[:notice] = if @comment.save
                       'You commented on a post!'
                     else
                       'Error - could not process comment'
                     end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end
end
