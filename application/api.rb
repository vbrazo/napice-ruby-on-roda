# Load path and gems/bundler
$LOAD_PATH << __dir__

require 'bundler'
require 'logger'
Bundler.require

require 'dotenv'
Dotenv.load

file_path = File.dirname(__FILE__)

%w(api/routes).each do |path|
  Dir["#{file_path}/#{path}/**/*.rb"].each { |file| require file }
end

require "#{file_path}/api/operations/base.rb"
require "#{file_path}/api/operations/company/demo.rb"
require "#{file_path}/api/operations/napicer/show_all.rb"
require "#{file_path}/api/operations/napicer/show.rb"
require "#{file_path}/api/operations/user/create.rb"

%w(api/models).each do |path|
  Dir["#{file_path}/#{path}/**/*.rb"].each { |file| require file }
end

require './application/api/api_support'
