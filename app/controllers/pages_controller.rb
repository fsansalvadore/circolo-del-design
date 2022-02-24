class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [
    :index,
    :privacy_cookie_policy,
    :contacts,
    :about_circolo,
    :about_team,
    :about_young_board_2021,
    :about_sostenitori,
    :about_newsletter,
    :servizi_spazi,
    :servizi_spazi_new,
    :servizi_biblioteca,
    :servizi_store,
    :membership
  ]
  before_action :set_page, only: [:about_newsletter, :servizi_spazi_new]
  after_action :redirect_to_root, only: [:about_newsletter, :servizi_spazi_new]

  def index
    @events = Event.where('data_fine >= ? OR data_inizio >= ?', DateTime.now, DateTime.now + 20).where("published = true").limit(5).sort_by{ |e| [e.priority, e.data_inizio] }
    @special_projects = SpecialProject.where("published = true").limit(5).order(year: :desc)
    @wpac = WpacSection.all.first
    @page = PageHome.all.first
    @cards = HomePageCard.where(page_home_id: @page.id, is_draft: false).order(:position)
    @col_1_links = HomePageColumnOneLink.where(page_home_id: @page.id).order(:position)
    @col_2_links = HomePageColumnTwoLink.where(page_home_id: @page.id).order(:position)
    @col_3_links = HomePageColumnThreeLink.where(page_home_id: @page.id).order(:position)
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
  
  def about_young_board_2021
    @collaborators = Collaborator.where(published: true).order(:position)
  end

  def about_sostenitori
  end
  
  def about_newsletter
    @page = Page.friendly.find_by_slug('newsletter')
  end

  def servizi_affitto_spazi
  end
  
  def servizi_spazi
    @page = Page.friendly.find_by_slug('spazi')
  end

  def servizi_biblioteca
  end

  def servizi_store
  end

  def membership
  end

  private

  def set_page
    @page = Page.friendly.find_by_slug(params[:slug])
  end
  
  def redirect_to_root
    redirect_to root_path unless @page.present?
  end
end
