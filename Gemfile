# A sample Gemfile
source "https://rubygems.org"

gem 'sinatra'
# fix problem with undefined method 'needs_migration'
gem 'activerecord', '4.2', :require => 'active_record'
#gem 'activerecord'
gem 'sinatra-activerecord'
gem 'rake'
gem 'require_all'
gem 'sqlite3'
gem 'thin'
gem 'shotgun'
gem 'pry'

group :test do
  gem 'launchy'
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end
