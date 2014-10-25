require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Beenz
  class Application < Rails::Application
    config.serve_static_assets = false
    config.time_zone = 'Central Time (US & Canada)'
    config.autoload_paths << Rails.root.join('lib')
  end
end
