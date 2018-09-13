# Load path and gems/bundler
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'tilt/erb'
require 'bundler'
require 'logger'
Bundler.require

require 'dotenv'
Dotenv.load

Dir["#{File.dirname(__FILE__)}/config/initializers/**/*.rb"].each { |file| require file }
Dir["#{File.dirname(__FILE__)}/api/graph/types/**/*.rb"].each { |file| require file }
Dir["#{File.dirname(__FILE__)}/api/models/**/*.rb"].each { |file| require file }
Dir["#{File.dirname(__FILE__)}/middlewares/**/*.rb"].each { |file| require file }

require './application/api/roda_graphql'
