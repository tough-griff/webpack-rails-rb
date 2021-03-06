lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "webpack/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "webpack-rails"
  s.version     = Webpack::Rails::VERSION
  s.authors     = ["Griffin Yourick"]
  s.email       = ["gryphon92@gmail.com"]
  s.homepage    = "https://github.com/tough-griff/webpack-rails-rb"
  s.summary     = "Rails/webpack integration plugin."
  s.description = "Easily implement webpack into your Rails project!"
  s.license     = "MIT"

  s.files = Dir[
    "lib/**/*",
    "LICENSE",
    "README.md",
  ]

  s.add_dependency "non-stupid-digest-assets", "~> 1.0"
  s.add_dependency "system-bang", "~> 1.0"

  s.add_development_dependency "awesome_print"
  s.add_development_dependency "bundler"
  s.add_development_dependency "pry"
  s.add_development_dependency "rails", "~> 4.0"
  s.add_development_dependency "rspec-rails"
end
