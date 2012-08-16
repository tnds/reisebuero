source 'https://rubygems.org'

gem 'rails', '3.2.6'

gem 'sqlite3'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'event-calendar', :require => 'event_calendar'
gem 'devise'

group :development, :test do
	gem "pry"
	gem "pry-rails"
	gem "rspec-rails"
	gem "rack-livereload"
end

gem "rails-erd", :group => :development

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
gem "jquery_datepicker"
gem "ri_cal"
gem "uuidtools"
gem "therubyracer", :group => :linux


  gem 'unicorn'
  gem 'capistrano', :path => "../capistrano"
	gem "rvm-capistrano", :require => false
	gem 'capistrano-unicorn', :require => false
