# Inject authorization token for root route
# Because we don't have it
# For real app you would use generally some kind of authentication

class PassAuthToken
  def initialize(app)
    @app = app
  end

  def call(env)
    data = {}
    token = Rack::JWT::Token.encode(data, ENV['RACK_COOKIE_SECRET'], 'HS256')
    env['HTTP_AUTHORIZATION'] = "Bearer #{token}" if env['REQUEST_PATH'] == '/'
    @app.call(env)
  end
end
