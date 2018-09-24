class RackAuthMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    auth = authenticate(env)

    if auth.is_a?(Hash) && auth[:errors]
      status = auth.delete(:status) || 200

      [status, { 'Content-Type' => 'application/json' }, [auth.to_json]]
    else
      @app.call(env)
    end
  end

  private

  def authenticate(env)
    return true unless authenticate_condition(env)
    
    JWT.decode(token(env), ENV['JWT_TOKEN'], true, algorithm: 'HS256')

    return true
  rescue JWT::ExpiredSignature
    authenticate_error(type: :token_expired, message: 'JWT token expired')
  rescue JWT::DecodeError
    authenticate_error(type: :token_format, message: 'JWT token unrecognized')
  end

  def authenticate_condition(env)
    env['Authorization'] || env['HTTP_AUTHORIZATION'] || !env['REQUEST_PATH']
  end

  def authenticate_error(args)
    {
      errors: [
        {
          type: args.fetch(:type),
          message: args.fetch(:message)
        }
      ]
    }
  end

  def token(env)
    (env['Authorization'] || env['HTTP_AUTHORIZATION']).gsub(/^Oauth\s/, '')
  end
end
