class ApiSupport < Roda
  use Rack::Session::Cookie, key: ENV['RACK_COOKIE_KEY'], secret: ENV['RACK_COOKIE_SECRET']
  use Rack::Protection
  use Rack::Protection::RemoteReferrer

  plugin :environments
  plugin :http_auth, authenticator: proc { |user, pass| [user, pass] == [ENV['HTTP_USER'], ENV['HTTP_PASSWORD']] }
  plugin :json, content_type: 'application/json'
  plugin :json_parser
  plugin :error_handler

  configure do |c|
    c.environment = ENV['ENVIRONMENT']
  end

  # Global error handler
  error do |e|
    case e
    when Sequel::ValidationFailed
      response.status = 422
      { error: 'Validation failed', messages: e.errors }
    when Sequel::NoMatchingRow
      response.status = 404
      { error: 'Record not found' }
    when ArgumentError
      response.status = 400
      { error: e.message }
    else
      # Log the error in production
      if opts[:environment] == 'production'
        puts "Error: #{e.class} - #{e.message}"
        puts e.backtrace.join("\n")
        { error: 'Internal server error' }
      else
        response.status = 500
        { error: 'Internal server error', message: e.message, backtrace: e.backtrace[0..5] }
      end
    end
  end

  require 'pry' if ENV['ENVIRONMENT'] == 'development'
end
