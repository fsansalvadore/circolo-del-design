class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :privacy_cookie_policy]

  def index
    @events = Event.all.where('data_fine >= ?', DateTime.now)
    render :layout => 'home'
  end

  def privacy_cookie_policy
  end
end
