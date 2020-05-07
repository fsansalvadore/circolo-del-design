class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [
    :index,
    :privacy_cookie_policy,
    :contacts,
    :about_circolo,
    :about_team,
    :about_sostenitori,
    :servizi_spazi,
    :servizi_biblioteca,
    :servizi_store,
    :membership
  ]

  def index
    # @events = Event.where('data_fine >= ? OR data_inizio >= ?', DateTime.now, DateTime.now + 20).where("published = true").sort_by{ |e| [e.priority, e.data_inizio] }
    # @blog_posts = BlogPost.where("published = true AND priority BETWEEN 1 AND 4").limit(5).sort_by{ |e| [e.priority, e.created_at] }
    @articles = Article.where("published = true AND priority BETWEEN 1 AND 4").limit(5).sort_by{ |e| [e.priority, e.created_at] }
    @slider_cover = Article.where("priority = 6 AND published = true").first
    @wpac = WpacSection.all.first
    # @slider_cover = BlogPost.where("priority = 6 AND published = true").first
    render :layout => 'home'
  end

  def privacy_cookie_policy
  end

  def contacts
    @contact = Event.new
  end

  def about_circolo
  end

  def about_team
    @members = TeamMember.where(published: true).order(:position)
  end

  def about_sostenitori
  end

  def servizi_spazi
  end

  def servizi_biblioteca
  end

  def servizi_store
  end

  def membership
  end
end
