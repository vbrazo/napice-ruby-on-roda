# Load test environment first
require 'dotenv'
Dotenv.load('.env.test')

# Add Simplecov configuration
require 'simplecov'
SimpleCov.start do
  add_filter '/.bundle/'
  add_filter '/application/config/'
  add_filter '/application/db/'
  add_filter '/spec/'
end

# Require gems and files
require './application/api'
require 'rspec/core'
require 'rack/test'
require 'database_cleaner/sequel'
require 'faker'
require 'factory_bot'
require 'rspec_sequel_matchers'

# Set locale en-US for faker
Faker::Config.locale = 'en-US'

# Necessary to test a cascading rack app and middleware
module RSpecHelpers
  include Rack::Test::Methods

  def app
    Rack::Builder.parse_file('config.ru').first
  end

  def response_body
    JSON.parse(last_response.body, symbolize_names: true)
  end
end

# FactoryBot is expecting ActiveRecord
module Sequel
  class Model
    alias save! save
  end
end

# Set up rspec basic configurations
RSpec.configure do |config|
  config.extend RSpecHelpers
  config.include RSpecHelpers
  config.include FactoryBot::Syntax::Methods
  config.include RspecSequel::Matchers

  config.disable_monkey_patching!
  config.filter_run_excluding :slow

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # require factory_bot files
  config.before(:suite) do
    FactoryBot.definition_file_paths = %w(./spec/factories)
    FactoryBot.find_definitions
  end

  # set up database_cleaner
  config.before(:suite) do
    DatabaseCleaner[:sequel].strategy = :transaction
    DatabaseCleaner[:sequel].clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner[:sequel].cleaning do
      example.run
    end
  end
end
