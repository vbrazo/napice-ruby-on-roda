class ApiSupport
  route do |r|
    response['Content-Type'] = 'application/json'

    r.on 'user' do
      r.on 'create' do
        r.post do
          query_params = format_params['query']
          
          unless query_params
            response.status = 400
            return { error: 'Missing query parameters' }.to_json
          end

          begin
            user_operation = Api::Operations::User::Create.new
            result = user_operation.call(user_hash: query_params)
            
            if result.is_a?(Hash) && result[:success]
              result.to_json
            elsif result.respond_to?(:errors) && !result.errors.empty?
              response.status = 422
              { error: 'Validation failed', messages: result.errors }.to_json
            else
              result.to_json
            end
          rescue Sequel::ValidationFailed => e
            response.status = 422
            { error: 'Validation failed', messages: e.errors }.to_json
          rescue StandardError => e
            response.status = 500
            { error: 'Internal server error', message: e.message }.to_json
          end
        end
      end
    end

    r.on 'company' do
      r.on 'demo' do
        r.post do
          query_params = format_params['query']
          
          unless query_params
            response.status = 400
            return { error: 'Missing query parameters' }.to_json
          end

          begin
            company_operation = Api::Operations::Company::Demo.new
            result = company_operation.call(company_hash: query_params)
            
            if result.is_a?(Hash) && result[:success]
              result.to_json
            elsif result.respond_to?(:errors) && !result.errors.empty?
              response.status = 422
              { error: 'Validation failed', messages: result.errors }.to_json
            else
              result.to_json
            end
          rescue Sequel::ValidationFailed => e
            response.status = 422
            { error: 'Validation failed', messages: e.errors }.to_json
          rescue StandardError => e
            response.status = 500
            { error: 'Internal server error', message: e.message }.to_json
          end
        end
      end
    end

    r.on 'napicer' do
      r.on 'index' do
        r.get do
          begin
            napicer_operation = Api::Operations::Napicer::ShowAll.new
            result = napicer_operation.call
            result.to_json
          rescue StandardError => e
            response.status = 500
            { error: 'Internal server error', message: e.message }.to_json
          end
        end
      end

      r.on 'show' do
        r.get do
          query_params = format_params['query']
          
          unless query_params && query_params['id']
            response.status = 400
            return { error: 'Missing id parameter' }.to_json
          end

          begin
            napicer_operation = Api::Operations::Napicer::Show.new
            result = napicer_operation.call(napicer_hash: query_params)
            
            if result.nil?
              response.status = 404
              { error: 'Napicer not found' }.to_json
            else
              result.to_json
            end
          rescue StandardError => e
            response.status = 500
            { error: 'Internal server error', message: e.message }.to_json
          end
        end
      end
    end

    # 404 handler for undefined routes
    r.on do
      response.status = 404
      { error: 'Route not found' }.to_json
    end
  end

  private

  def format_params
    request.params
  end
end
