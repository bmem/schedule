source "http://rubygems.org"

# Declare your gem's dependencies in schedule.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"
# runtime gems
gem "haml-rails"
gem "formtastic"
gem "sass-rails"
gem "cancan"
gem "devise", ">= 2.0.0rc" # apps can use any authentication method

# One could also drop schedule_person and change Schedule::Person.table_name
# Patched to fix various stack overflow and sqlite compatibility errors
gem "rails_sql_views", :git => "git://github.com/flwyd/rails_sql_views"

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'ruby-debug'
