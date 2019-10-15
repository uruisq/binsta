require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Binsta
  class Application < Rails::Application

    config.load_defaults 5.2

    config.generators do |g|
      g.assets false
      g.helper false
      g.jbuilder false
    end
  end
end
