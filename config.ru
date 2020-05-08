# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
require 'rack/rewrite'

run Rails.application

use Rack::Rewrite do
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-joseph-grima', '/whats-on/WPAC/joseph-grima'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-joseph-grima-1b15854c-ae76-4140-b3ab-bdcfd77f2dd2', '/whats-on/WPAC/joseph-grima'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-stefano-mirti', '/whats-on/WPAC/stefano-mirti'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-stefano-mirti-b3dd99e3-7a53-4ec1-bf7c-274b346556c1', '/whats-on/WPAC/stefano-mirti'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-stefano-caggiano', '/whats-on/WPAC/stefano-caggiano'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-pippo-ciorra', '/whats-on/WPAC/pippo-ciorra'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-pippo-ciorra-af372372-4866-49ad-ad22-17518fe95747', '/whats-on/WPAC/pippo-ciorra'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-annalisa-rosso', '/whats-on/WPAC/annalisa-rosso'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-annalisa-rosso-97d04da7-6709-433a-8c43-3c60d8b6bef1', '/whats-on/WPAC/annalisa-rosso'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-formafantasma', '/whats-on/WPAC/formafantasma'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-formafantasma-7ab92201-0ac5-4428-86b7-f179cb51efa2', '/whats-on/WPAC/formafantasma'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-giorgia-lupi', '/whats-on/WPAC/giorgia-lupi'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-giorgia-lupi-34cfab5b-20bc-4379-bef7-456043d76129', '/whats-on/WPAC/giorgia-lupi'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-luca-molinari', '/whats-on/WPAC/luca-molinari'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-luca-molinari-d868b3c0-d5c4-4579-8869-5f1b31f0b733', '/whats-on/WPAC/luca-molinari'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-ugo-la-pietra', '/whats-on/WPAC/ugo-la-pietra'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-ugo-la-pietra-2abc0e70-5c48-4032-8da8-d63d322702fc', '/whats-on/WPAC/ugo-la-pietra'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-beatrice-leanza', '/whats-on/WPAC/beatrice-leanza'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-beatrice-leanza-590dd4b4-2429-459e-a267-b809cc7c6343', '/whats-on/WPAC/beatrice-leanza'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-angela-rui', '/whats-on/WPAC/angela-rui'
  moved_permanently '/whats-on/HomingCdD/welcome-to-the-post-analog-condition-angela-rui-e8146068-a145-4189-9407-e5680a98e7b2', '/whats-on/WPAC/angela-rui'
end
