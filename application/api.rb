# Load path and gems/bundler
$LOAD_PATH << __dir__

require 'bundler'
require 'logger'
Bundler.require

require 'dotenv'
Dotenv.load

file_path = File.dirname(__FILE__)

# Load database configuration first
require "#{file_path}/config/sequel"
require "#{file_path}/config/database"

# Load operations base
require "#{file_path}/api/operations/base.rb"

# Load models
%w(api/models).each do |path|
  Dir["#{file_path}/#{path}/**/*.rb"].sort.each { |file| require file }
end

# Load operations
require "#{file_path}/api/operations/company/demo.rb"
require "#{file_path}/api/operations/napicer/show_all.rb"
require "#{file_path}/api/operations/napicer/show.rb"
require "#{file_path}/api/operations/user/create.rb"

# Load ApiSupport first, then routes
require './application/api/api_support'

%w(api/routes).each do |path|
  Dir["#{file_path}/#{path}/**/*.rb"].sort.each { |file| require file }
end
