class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :privacy_cookie_policy, :contacts]

  def index
    @events = Event.all.where('data_fine >= ?', DateTime.now)
    render :layout => 'home'
  end

  def privacy_cookie_policy
  end

  def contacts
    @contact = Event.new

    @markers = [lat: 45.065, lng: 7.687]
  end
end
