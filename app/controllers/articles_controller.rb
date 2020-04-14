class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:wpac, :index, :show]
  before_action :set_article, only: [:show]

  def index
  end

  def media
    @articles = Article.where("published = true AND priority != 6").order(created_at: :desc)
  end

  def tag
    @articles = Article.where("published = true AND priority != 6").order(created_at: :desc)
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
