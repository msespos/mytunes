class ImagePostsController < ApplicationController
  def new
    @image_post = ImagePost.new
  end

  def create
    @image_post = ImagePost.new(image_post_params)
    @image_post.user_id = current_user.id
    if @image_post.save
      flash[:notice] = 'Post created!'
      redirect_to image_posts_path
    else
      flash[:notice] = 'Error - could not process post creation'
      render 'new'
    end
  end
end

def image_post_params
  params.require(:image_post).permit(:image)
end
