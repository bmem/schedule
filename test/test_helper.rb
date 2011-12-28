# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Add all the Schedule routes as main app routes so test cases can use foo_path
Schedule::Engine.routes.named_routes.each do |name, route|
  Rails.application.routes.named_routes.add(name, route)
end

class ActiveSupport::TestCase
  fixtures :all
end

class ActionController::TestCase
  fixtures :all
end
