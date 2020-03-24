class BlogPostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_blog_post, only: [:show]

  def index
    # @slider_cover = BlogPost.find("priority = 6 AND published = true")
    @blog_posts = BlogPost.where("published = true AND priority != 6").order(created_at: :desc)
  end

  def show
    @blog_post_sections = BlogPostSection.where("visible = true AND blog_post_id = ?", @blog_post.id)
                                          .order(:position)

    @suggested_posts = BlogPost.where("published = true AND priority BETWEEN 1 AND 5").where.not(id: @blog_post.id).limit(3).order(created_at: :desc)
  end

  private

  def set_blog_post
    @blog_post = BlogPost.friendly.find_by_slug(params[:slug])
  end
end
