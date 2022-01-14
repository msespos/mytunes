class PostsController < ApplicationController
  def index
    @viewable_text_posts = TextPost.order('created_at DESC').select do |p|
      p.viewable_by?(current_user)
    end
  end
end
