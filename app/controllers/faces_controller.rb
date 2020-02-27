class FacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @faces = Face.where(published: true).order(:cognome)
  end
end
