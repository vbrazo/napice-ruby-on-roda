require 'rack/auth/abstract/request'

class Request < Rack::Auth::AbstractRequest
  # This method encapsulates the various checks we need to make against the request's
  # Authorization header before we deem it ready for verification.
  # Upon passing the checks, we yield to the block so that simple_oauth can determine
  # whether or not the request has been properly signed.
  #
  def with_valid_request
    # provided? is defined in Rack::Auth::AbstractRequest
    if provided? && request_condition
      unauthorized
    else
      yield(request.env)
    end
  end

  def request_condition
    !oauth? || params[:consumer_key].nil? ||
      params[:signature].nil? || params[:signature_method].nil?
  end

  def verify_signature(client)
    return false unless client

    header = SimpleOAuth::Header.new(request.request_method,
                                     request.url,
                                     included_request_params,
                                     auth_header)

    header.valid?(consumer_secret: client.consumer_secret)
  end

  def consumer_key
    params[:consumer_key]
  end

  private

  def unauthorized
    [401, {}, ['Unauthorized!']]
  end

  def params
    @params ||= SimpleOAuth::Header.parse(auth_header)
  end

  def oauth?
    # scheme is defined as an instance method on Rack::Auth::AbstractRequest
    scheme.to_sym == :oauth
  end

  def auth_header
    @env[authorization_key]
  end

  # only include request params if Content-Type is set to application/x-www/form-urlencoded
  # (see http://tools.ietf.org/html/rfc5849#section-3.4.1)
  #
  def included_request_params
    request.content_type == 'application/x-www-form-urlencoded' ? request.params : nil
  end
end
