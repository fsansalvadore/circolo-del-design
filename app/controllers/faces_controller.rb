class FacesController < ApplicationController
  def index
    @faces = Face.where(published: true).order(:cognome)
  end
end
