class PostsController < ApplicationController
  def index
    posts = TextPost.all + ImagePost.all
    @viewable_posts = posts.sort { |x,y| y.created_at <=> x.created_at }.select do |p|
      p.viewable_by?(current_user)
    end
  end
end
