class SitemapsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @host = "#{request.protocol}#{request.host}"
    @events = Event.all.where(published: true)
  end
end
