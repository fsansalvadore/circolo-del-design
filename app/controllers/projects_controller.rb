class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [
    :index,
    :ask_to_design,
    :video_torino_creative_city_unesco,
    :interaction_20
  ]

  def index
  end

  def ask_to_design
  end

  def video_torino_creative_city_unesco
  end

  def interaction_20
  end
end
