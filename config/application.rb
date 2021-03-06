require File.expand_path('../boot', __FILE__)
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



module ChatSpace
  class Application < Rails::Application
     config.generators do |g|
        g.javascript false
        g.stylesheets false
        g.helper false
        g.template_engine = :haml
        g.test_framework :rspec,
          fixture: true,
          view_specs: false,
         helper_specs: false,
         controller_specs: true
       g.fixture_replacement :factory_girl, dir: 'spec/factories'
        config.i18n.default_locale = :ja
     end
  end
end
