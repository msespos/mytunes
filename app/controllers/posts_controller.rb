# frozen_string_literal: true

# Posts controller class
class PostsController < ApplicationController
  def index
    @viewable_posts = TextPost.order('created_at DESC').select do |p|
      p.viewable_by?(current_user)
    end
  end

  def new
    @post = TextPost.new
  end

  def create
    @post = TextPost.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = 'Post created!'
      redirect_to posts_path
    else
      flash[:notice] = 'Error - could not process post creation'
      render 'new'
    end
  end

  def like
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    flash[:notice] = if @like.save
                       'You liked a post!'
                     else
                       'Error - could not process like'
                     end
    redirect_to posts_path
  end

  def comment
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    flash[:notice] = if @comment.save
                       'You commented on a post!'
                     else
                       'Error - could not process comment'
                     end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def like_params
    params.require(:like).permit(:post_id)
  end

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end
end
