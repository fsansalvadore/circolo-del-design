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
    :servizi_store
  ]

  def index
    @events = Event.all.where('data_fine >= ?', DateTime.now)
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
  end

  def about_sostenitori
  end

  def servizi_spazi
  end

  def servizi_biblioteca
  end

  def servizi_store
  end
end
