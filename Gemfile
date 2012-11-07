source 'https://rubygems.org'

gem 'rails', '3.2.6'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end

gem 'jquery-rails'

gem 'event-calendar', :require => 'event_calendar'
gem 'devise'
gem 'simple_form'

group :development, :test do
  gem 'sqlite3'
	gem "pry"
	gem "pry-rails"
	gem "rspec-rails"
	gem "rack-livereload"
end

group :development do
  gem "rails-erd"
  gem 'copycopter_client'
end

group :test do
  gem "factory_girl_rails"
	gem 'guard-cucumber'
	gem 'guard-livereload'
	gem "launchy"
	gem "cucumber-rails", :require => false
	gem "capybara"
	gem "capybara-webkit"
	gem "database_cleaner"
end

gem "cancan"
gem "ui_datepicker-rails3"
gem "ri_cal"
gem "uuidtools"

group :production do
  gem 'pg'
  gem 'unicorn'
end

gem "therubyracer"

  gem 'capistrano'
	gem "rvm-capistrano", :require => false
	gem 'capistrano-unicorn', :require => false

gem "high_voltage"
