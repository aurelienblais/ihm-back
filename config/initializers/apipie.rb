# frozen_string_literal: true

Apipie.configure do |config|
  config.app_name                = 'IhmBack'
  config.api_base_url            = '/api'
  config.doc_base_url            = '/apipie'
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.default_locale          = 'en'
end
