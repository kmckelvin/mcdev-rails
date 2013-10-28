source 'https://bundler-api.herokuapp.com'

ruby '2.1.0'

gem 'airbrake'
gem 'bourbon'
gem 'coffee-rails'
gem 'delayed_job_active_record', '>= 4.0.0'
gem 'email_validator'
gem 'flutie'
gem 'font-awesome-rails'
gem 'high_voltage'
gem 'jquery-rails'
gem 'neat'
gem 'pg'
gem 'puma'
gem 'rack-timeout'
gem 'rails', '>= 4.0.0'
gem 'recipient_interceptor'
gem 'rubysl'
gem 'sass-rails'
gem 'simple_form'
gem 'slim-rails', '>= 2.0'
gem 'uglifier'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', '>= 2.14'
end

group :test do
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.6.7'
end
