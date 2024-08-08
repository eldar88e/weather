source "https://rubygems.org"

ruby "3.2.2"
gem "rails", "~> 7.1.3" #7.1.3.4

gem "sprockets-rails"
gem "pg", "~> 1.5"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem 'good_job'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "pry"
end

group :development do
  gem "web-console"
end

group :test do
  gem 'rspec-rails', require: false
  gem 'webmock'
  gem 'vcr'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'database_cleaner-active_record'
end

