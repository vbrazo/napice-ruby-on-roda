source 'https://rubygems.org'

group :development do
  gem 'rake'
end

gem 'colorize'
gem 'dotenv'
gem 'graphql'
gem 'pg', '0.18.4'
gem 'rack-jwt'
gem 'rack-protection', '1.5.5'
gem 'roda'
gem 'sequel'
gem 'simplecov'
gem 'tilt'
gem 'unicorn'

group :development, :test do
  gem 'awesome_print', '1.8.0'
  gem 'pry', '0.11.3'
  gem 'rubocop'
end

group :test, :'test-staging' do
  gem 'factory_bot', '4.8.2'
  gem 'faker', '1.8.7'
  gem 'rack-test', '1.0.0'
  gem 'rspec', '3.7.0'
  gem 'rspec_sequel_matchers', '0.4.0'
end
