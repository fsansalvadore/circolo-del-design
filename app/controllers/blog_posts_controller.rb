class BlogPostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_blog_post, only: [:show]

  def index
    @homing_cover = BlogPost.where("priority = 1 AND published = true").first
    @blog_posts = BlogPost.where(published: true).order(updated_at: :desc)
  end

  def show
    @blog_post_sections = BlogPostSection.where("visible = true AND blog_post_id = ?", @blog_post.id )
                                          .order(:position)

    @suggested_posts = BlogPost.where("published = true AND priority != 1").where.not(id: @blog_post.id).limit(3)
  end

  private

  def set_blog_post
    @blog_post = BlogPost.friendly.find_by_slug(params[:slug])
  end
end
