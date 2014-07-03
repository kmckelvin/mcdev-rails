source 'https://rubygems.org'

ruby '2.1.2'

# keep this first
gem 'dotenv-rails', group: [:development, :test]

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'airbrake'
gem 'bourbon'
gem 'coffee-rails'
gem 'email_validator'
gem 'flutie'
gem 'font-awesome-rails'
gem 'github-markdown'
gem 'high_voltage'
gem 'jquery-rails'
gem 'kaminari'
gem 'neat'
gem 'pg'
gem 'pygments.rb'
gem 'rack-timeout'
gem 'rails', '4.0.4'
gem 'recipient_interceptor'
gem 'redcarpet'
gem 'sass-rails', '~> 4.0.2'
gem 'simple_form'
gem 'slim-rails', '>= 2.0'
gem 'turbolinks'
gem 'uglifier'
gem 'unicorn'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
  gem 'quiet_assets'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'poltergeist'
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.6.7'
  gem 'rails_12factor'
end
