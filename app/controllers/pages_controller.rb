class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [
    :index,
    :privacy_cookie_policy,
    :contacts,
    :about_circolo,
    :about_team,
    :about_young_board,
    :about_sostenitori,
    :servizi_spazi,
    :servizi_biblioteca,
    :servizi_store,
    :membership
  ]

  def index
    @events = Event.where('data_fine >= ? OR data_inizio >= ?', DateTime.now, DateTime.now + 20).where("published = true").limit(5).sort_by{ |e| [e.priority, e.data_inizio] }
    @special_projects = SpecialProject.where("published = true").limit(5).order(year: :desc)
    @wpac = WpacSection.all.first
    @page = PageHome.all.first
    @cards = HomePageCard.where(page_home_id: @page.id).order(:position)
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
  
  def about_young_board
    @collaborators = Collaborator.where(published: true).order(:position)
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
