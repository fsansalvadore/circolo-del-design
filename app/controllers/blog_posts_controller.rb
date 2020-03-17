class BlogPostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_blog_post, only: [:show]

  def index
    @blog_posts = BlogPost.where(published: true)
  end

  def show
    @suggested_posts = BlogPost.where(published: true).where.not(id: @blog_post.id).limit(3)
  end

  private

  def set_blog_post
    @blog_post = BlogPost.friendly.find_by_slug(params[:slug])
  end
end
