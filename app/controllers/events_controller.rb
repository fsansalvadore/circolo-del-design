class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :missing_out, :club_futuro_vol_1_the_exhibition]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def missing_out
  end

  def club_futuro_vol_1_the_exhibition
  end
end
