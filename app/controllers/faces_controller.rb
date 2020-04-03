class FacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @faces = Face.where(published: true).order(:cognome)
  end

  def show
    @face = Face.friendly.find_by_slug(params[:slug])
  end
end
