require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module FlatReport
  class Application < Rails::Application
    config.load_defaults 5.1
    # Test unit
    config.generators.system_tests = nil
    # I18n
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:ja, :en]
    # Time zone
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # Generators
    config.generators do |g|
      g.assets false
      g.helper false
      g.template_engine = :slim
      g.test_framework :rspec, view_specs: false, routing_specs: false
    end
    # Load paths
    config.autoload_paths += %W[#{config.root}/lib]
  end
end
