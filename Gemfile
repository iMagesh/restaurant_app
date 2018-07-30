source 'http://rubygems.org'
ruby '2.2.6'

# Must go before other gems
gem 'dotenv-rails'

gem 'active_model_serializers', '0.9.3'
gem 'coffee-rails', '~> 4.1.0'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'pg', '0.21.0'
gem 'rails', '4.2.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'versionist'
gem 'thor', '0.19.1'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'colorize'
  gem 'foreman'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_apps_pages'
  gem 'rails_apps_testing'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'seed_dump'
  gem 'spring-commands-rspec'
  gem 'byebug'
  gem "letter_opener"
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'thin'
  gem 'rails-erd'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  # gem 'capybara'
  gem 'database_cleaner'
  # gem 'launchy'
  # gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end
