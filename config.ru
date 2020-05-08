# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'rack/rewrite'

use Rack::Rewrite do
  moved_permanently "https://www.circolodeldesign.it/whats-on/HomingCdD/welcome-to-the-post-analog-condition-joseph-grima", "https://www.circolodeldesign.it/whats-on/WPAC/joseph-grima"
end

run Rails.application
