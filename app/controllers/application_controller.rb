class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_global_settings

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def set_global_settings
    @global_settings = GlobalSetting.all.first
  end
end
