# Load path and gems/bundler
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'tilt/erb'
require 'bundler'
require 'logger'
Bundler.require

require 'dotenv'
Dotenv.load

# Local config
require "find"

%w{config/initializers api/graph/types api/graph/models middlewares}.each do |load_path|
  Find.find(load_path) do |f|
    require_relative f unless f.match(/\/\..+$/) || File.directory?(f)
  end
end

logger = Logger.new(STDOUT)

logger.level = Logger::DEBUG
logger.formatter = proc do |severity, datetime, progname, msg|
  date_format = datetime.strftime("%Y-%m-%d %H:%M:%S")
  if severity == "INFO"
    "[#{date_format}] #{severity}  (#{progname}): #{msg}\n".blue
  elsif severity == "WARN"
    "[#{date_format}] #{severity}  (#{progname}): #{msg}\n".orange
  else
    "[#{date_format}] #{severity} (#{progname}): #{msg}\n".red
  end
end

DB.loggers << logger if logger

require_relative './application/api/roda_graphql'
