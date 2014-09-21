source 'https://rubygems.org'
ruby '2.0.0'
#ruby-gemset=codero_project_4_0

gem 'rails', '4.0.8'

group :development, :test do
	gem 'sqlite3', '1.3.8'
	gem 'rspec-rails', '2.13.1'
	gem 'guard-rspec', '2.5.0'
end

group :test do
	gem 'capybara', '2.1.0'
	gem 'factory_girl_rails', '4.2.0'
	gem 'database_cleaner', github: 'bmabey/database_cleaner'
	gem 'shoulda-matchers', require: false
end

gem 'bootstrap-sass', '~> 3.2.0'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'sass-rails', '4.0.3'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.0.4'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'
gem 'therubyracer', platforms: :ruby
gem 'libnotify', '0.8.0'
gem 'devise'
gem 'faker'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end