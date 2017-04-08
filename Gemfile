source 'http://rubygems.org'

gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'

gem 'sinatra'
gem 'sqlite3'
gem 'tux'
gem 'rake'
gem 'shotgun' #adding this...
#tried 'bundle exec rake' but didn't work,
#so did 'bundle clean --force' 
#then 'bundle' to get correct gem 'rake' version installed.
gem 'require_all'

group :test do
  gem 'rspec'
  gem 'pry'
  gem 'pry-nav'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end
