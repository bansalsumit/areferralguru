source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem 'rubocop', '~> 1.26'
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem 'shopify-cli', '~> 2.14'
gem 'shopify_api', '~> 9.5', '>= 9.5.1'
gem 'shopify_app', '~> 18.1', '>= 18.1.2'
gem 'shopify-cloud', '~> 9001.0'
gem 'httparty', '~> 0.20.0'

gem 'link-header-parser'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem 'ngrok-tunnel', '~> 2.1', '>= 2.1.1'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
