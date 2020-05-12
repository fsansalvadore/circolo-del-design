class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :media, :tag, :show]
  before_action :set_article, only: [:show]
  before_action :set_wpac_generic, only: [:index, :tag, :media, :show]

  def index
    @themes = ArticleTheme.where(published: true)
    render :layout => 'wpac'
  end

  def tag
    @tag = params[:tag].gsub("-", " ").downcase
    @tagItem = ArticleTheme.find {|theme| theme.nome.downcase == @tag}
    @articles = Article.tagged_with(params[:tag].gsub("-", " ").capitalize).where("published = true AND priority != 6").shuffle.filter {|a| a.publish_date.nil? || a.publish_date.strftime("%Y-%jT%T%:z") <= Time.now.strftime("%Y-%jT%T%:z")}
    @now = Time.now
    render :layout => 'wpac'
  end

  def media
    @media = params[:media_type].gsub("-", " ").downcase
    @articles = Article.where("media_type = ? AND published = true AND priority != 6", @media.capitalize).shuffle
    render :layout => 'wpac'
  end

  def show
    @article_sections = ArticleSection.where("visible = true AND article_id = ?", @article.id).order(:position)
    @tags = @article.tag_list
    @related_articles = @article.find_related_tags.where(published: true).order(created_at: :desc).filter {|a| a.publish_date.nil? || a.publish_date.strftime("%Y-%jT%T%:z") <= Time.now.strftime("%Y-%jT%T%:z")}
    render :layout => 'wpac-show'
  end

  private

  def set_article
    @article = Article.friendly.find_by_slug(params[:slug])
  end

  def set_wpac_generic
    @wpac = WpacSection.all.first
  end
end
