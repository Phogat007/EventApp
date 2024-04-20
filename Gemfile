source "https://rubygems.org"

ruby "3.3.0"
gem "rails", "~> 7.1.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "prawn"
gem 'fastimage'
gem "devise", "~> 4.9"
gem 'capistrano', '~> 3.11'
gem 'capistrano-rails', '~> 1.4'
gem 'capistrano-passenger', '~> 0.2.0'
gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails', '~> 6.1.0'
  gem 'shoulda-matchers'
  gem 'capybara', '>= 3.26'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem "web-console"
end

group :test do
  gem "selenium-webdriver"
end
