require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CircoloDelDesign
  class Application < Rails::Application
    config.action_view.embed_authenticity_token_in_remote_forms = true

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
    config.i18n.available_locales = [:it, :en]
    config.i18n.default_locale = :it
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
  moved_permanently "https://circolodeldesign.herokuapp.com/", "https://www.circolodeldesign.it/"
  moved_permanently "https://www.circolodeldesign.it/whats-on/HomingCdD", "https://www.circolodeldesign.it/whats-on/WPAC"
end
