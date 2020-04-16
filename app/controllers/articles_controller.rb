class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :media, :tag, :show]
  before_action :set_article, only: [:show]

  def index
    @tags = ActsAsTaggableOn::Tag.all.each do |tag|
      tag.name
    end
    render :layout => 'wpac'
  end

  def media
    @articles = Article.where("media_type = ? AND published = true AND priority != 6", params[:media_type]).order(created_at: :desc)
    render :layout => 'wpac'
  end

  def tag
    @tag = params[:tag].gsub("-", " ").capitalize
    @articles = Article.tagged_with(params[:tag].gsub("-", " ").capitalize).where(published: true).order(created_at: :desc)
    render :layout => 'wpac'
  end

  def show
    @article_sections = ArticleSection.where("visible = true AND article_id = ?", @article.id)

    @related_articles = Article.where("published = true AND priority BETWEEN 1 AND 5").where.not(id: @article.id).order(created_at: :desc)
  end

  private

  def set_article
    @article = Article.friendly.find_by_slug(params[:slug])
  end
end
