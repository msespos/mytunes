class PostsController < ApplicationController
  def index
    posts = TextPost.all + ImagePost.all
    @viewable_posts = posts.sort { |x, y| y.created_at <=> x.created_at }.select do |p|
      p.viewable_by?(current_user)
    end
  end

  def like
    @like = Like.new(like_params)
    @like.user_id = current_user.id
    @like.post = TextPost.find(like_params[:post_id])
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
    @comment.post = TextPost.find(comment_params[:post_id])
    flash[:notice] = if @comment.save
                       'You commented on a post!'
                     else
                       'Error - could not process comment'
                     end
    redirect_to posts_path
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end
end
