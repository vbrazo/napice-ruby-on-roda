# Add Simplecov configuration
require 'simplecov'
SimpleCov.start do
  add_filter '/.bundle/'
  add_filter '/application/config/'
  add_filter '/application/db/'
  add_filter '/spec/'
end

require 'rspec/core'
require 'rack/test'
require './application/api'
require 'faker'
require 'factory_bot'
require 'rspec_sequel_matchers'

Faker::Config.locale = 'en-US'

# This is necessary to test a cascading rack app
module RSpecHelpers
  include Rack::Test::Methods

  def login_as(user)
    Api.class_variable_set(:@@current_user, user)
  end

  def app
    Rack::Builder.parse_file('config.ru').first
  end

  def response_body
    JSON.parse(last_response.body, symbolize_names: true)
  end

  def set_request_headers
    header 'Access-Control-Allow-Headers', 'Origin, Content-Type, Accept, Authorization, Token'
  end
end

# FactoryBot is expecting ActiveRecord
module Sequel
  class Model
    alias save! save
  end
end

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

  config.before(:suite) do
    FactoryBot.definition_file_paths = %w(./spec/factories)
    FactoryBot.find_definitions
  end
end
