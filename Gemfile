source 'https://rubygems.org'

group :development do
  gem 'rake'
end

gem 'dotenv'
gem 'unicorn'
gem 'roda'
gem 'tilt'

gem 'graphql'

gem 'sequel'
gem 'colorize'

gem 'sqlite3'
gem 'pg', '0.18.4'

# Protection :)
gem 'rack-protection', '1.5.5'

# Token :)
gem 'rack-jwt'

gem 'simplecov'

group :development, :test, :'test-staging' do
  gem 'awesome_print', '1.8.0'
  gem 'pry', '0.11.3'
end

group :test, :'test-staging' do
  gem 'rspec_sequel_matchers', '0.4.0'
  gem 'factory_bot', '4.8.2'
  gem 'faker', '1.8.7'
  gem 'rack-test', '1.0.0'
  gem 'rspec', '3.7.0'
end
