$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "schedule/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "schedule"
  s.version     = Schedule::VERSION
  s.authors     = ['Trevor "Stonebeard" Stone']
  s.email       = ["bmem-list@burningman.com"]
  s.homepage    = "TODO"
  s.summary     = "BMEM engine for scheduling shifts at an event."
  s.description = "People sign up for shifts at an event."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0.rc1"
  s.add_dependency "jquery-rails"
  s.add_dependency "haml-rails"
  s.add_dependency "formtastic"
  s.add_dependency "cancan"

  s.add_development_dependency "sqlite3"
end
