require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module FlatReport
  class Application < Rails::Application
    config.load_defaults 5.1
    config.generators.system_tests = nil
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:ja, :en]
    config.time_zone = 'Tokyo'
    config.generators do |g|
      g.assets false
      g.helper false
      g.template_engine = :slim
      g.test_framework :rspec, view_specs: false, routing_specs: false
    end
    config.autoload_paths += %W[#{config.root}/lib]
  end
end
