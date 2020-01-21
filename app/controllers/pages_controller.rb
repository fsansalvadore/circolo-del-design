class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :privacy_cookie_policy]

  def index
  end

  def privacy_cookie_policy
  end
end
