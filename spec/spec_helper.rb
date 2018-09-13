# Add Simplecov configuration
require 'simplecov'

SimpleCov.start do
  add_filter '/application/config/'
  add_filter '/application/db/'
  add_filter '/.bundle/'
  add_filter '/spec/'
end

require 'rspec/core'
require 'rack/test'

require './application/api'
require 'faker'
require 'factory_bot'
require 'rspec_sequel_matchers'

Faker::Config.locale = 'en-US'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include RspecSequel::Matchers

  config.disable_monkey_patching!
  config.filter_run_excluding :slow

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
