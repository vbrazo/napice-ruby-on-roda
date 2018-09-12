require_relative './graph/schema'

class RodaGraphql < Roda
  use Rack::Session::Cookie, key: ENV['RACK_COOKIE_KEY'], secret: ENV['RACK_COOKIE_SECRET']
  use Rack::Protection
  use Rack::Protection::RemoteReferrer
  use PassAuthToken
  use Rack::JWT::Auth, {secret: ENV['RACK_COOKIE_SECRET'], options: { algorithm: 'HS256' }}

  plugin :environments
  self.environment = ENV['ENVIRONMENT']

  plugin :flash
  plugin :json
  plugin :json_parser
  plugin :render, engine: 'erb'
  plugin :view_options
  plugin :assets
  plugin :multi_route

  require_relative './routes/main.rb'

  Dir['./routes/*.rb'].each{ |f| require_relative f}
end
