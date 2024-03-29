class ApiSupport < Roda
  use Rack::Session::Cookie, key: ENV['RACK_COOKIE_KEY'], secret: ENV['RACK_COOKIE_SECRET']
  use Rack::Protection
  use Rack::Protection::RemoteReferrer

  plugin :environments
  plugin :http_auth, authenticator: proc { |user, pass| [user, pass] == [ENV['HTTP_USER'], ENV['HTTP_PASSWORD']] }
  plugin :json, content_type: 'application/json'
  plugin :json_parser

  self.environment = ENV['ENVIRONMENT']

  require 'pry'
  require_relative './routes/main.rb'
end
