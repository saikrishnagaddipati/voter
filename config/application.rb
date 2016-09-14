require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Voter
  class Application < Rails::Application
  	config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

# module AssetsInitializers
#   class Railtie < Rails::Railtie
#     initializer "assets_initializers.initialize_rails",
#                 :group => :assets do |app|
#       require "#{Rails.root}/config/initializers/facebook.rb" 
#     end
#   end
# end