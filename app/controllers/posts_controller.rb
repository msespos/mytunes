# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

# Posts controller class
class PostsController < ApplicationController
  def index
    posts = TextPost.all + ImagePost.all + AudioPost.all
    @viewable_posts = posts.sort { |x, y| y.created_at <=> x.created_at }.select do |p|
      p.viewable_by?(current_user)
    end
  end

  def like
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    case like_params[:post_type]
    when 'TextPost'
      @like.post = TextPost.find(like_params[:post_id])
      @like.post_type = 'TextPost'
    when 'ImagePost'
      @like.post = ImagePost.find(like_params[:post_id])
      @like.post_type = 'ImagePost'
    else
      @like.post = AudioPost.find(like_params[:post_id])
      @like.post_type = 'AudioPost'
    end
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
    case comment_params[:post_type]
    when 'TextPost'
      @comment.post = TextPost.find(comment_params[:post_id])
      @comment.post_type = 'TextPost'
    when 'ImagePost'
      @comment.post = ImagePost.find(comment_params[:post_id])
      @comment.post_type = 'ImagePost'
    else
      @comment.post = AudioPost.find(comment_params[:post_id])
      @comment.post_type = 'AudioPost'
    end
    flash[:notice] = if @comment.save
                       'You commented on a post!'
                     else
                       'Error - could not process comment'
                     end
    redirect_to posts_path
  end

  private

  def like_params
    params.require(:like).permit(:post_id, :post_type)
  end

  def comment_params
    params.require(:comment).permit(:post_id, :post_type, :body)
  end
end

# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
