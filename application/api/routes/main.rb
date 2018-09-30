class ApiSupport
  route do |r|
    r.root do
      'Nothing Here'
    end

    r.on 'user' do
      r.on 'create' do
        r.post do
          params = format_params

          create_user_operation = Api::Operations::User::Create.new(params['query'])
          result = create_user_operation.create

          result.to_json
        end
      end
    end
  end

  def format_params
    request.params
  rescue StandardError
    JSON.parse(request.body.read)
  end
end
