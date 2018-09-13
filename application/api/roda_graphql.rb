require_relative './graph/schema'

class RodaGraphql < Roda
  use Rack::Session::Cookie, key: ENV['RACK_COOKIE_KEY'], secret: ENV['RACK_COOKIE_SECRET']
  use Rack::Protection
  use Rack::Protection::RemoteReferrer
  use PassAuthToken
  use Rack::JWT::Auth, secret: ENV['RACK_COOKIE_SECRET'], options: { algorithm: 'HS256' }

  plugin :environments
  plugin :json
  plugin :json_parser

  self.environment = ENV['ENVIRONMENT']

  require_relative './routes/main.rb'
end
