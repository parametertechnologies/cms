require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cms
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Application configuration stored in config/cms.yml
    # Access configuration values: # Rails.configuration.cms['cms_title']
    config.cms = config_for(:cms)

  end
end
