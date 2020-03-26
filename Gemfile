# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 6.0.2", ">= 6.0.2.1"

gem "pg", ">= 0.18", "< 2.0"

# Use Puma as the app server
gem "puma", "~> 4.1"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"

gem "haml-rails",     "~> 2.0"
gem "jquery-rails",   "~> 4.3.5"
gem "bootstrap", "~> 4.4.1"
gem "devise", "~> 4.7", ">= 4.7.1"
gem "simple_form", "~> 5.0", ">= 5.0.2"
gem "pumi", github: "dwilkie/pumi", require: "pumi/rails"

gem "font-awesome-rails", "~> 4.7.0.5"
gem "device_detector", "~> 1.0", ">= 1.0.3"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false
gem "social-share-button", "~> 1.2.1"

gem "ahoy_matey",  "~> 3.0.1"
gem "sentry-raven", "~> 2.13.0"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 4.0.0.rc1"
  gem "ffaker", "~> 2.13.0"
  gem "rubocop-rails", "~> 2.4.2"
  gem "rubocop-performance", "~> 1.5.2"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "annotate", "~> 3.1.0"
  gem "solargraph", "~> 0.38.5"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"

  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
