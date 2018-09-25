class ApiSupport
  route do |r|
    r.root do
      'Nothing Here'
    end

    r.on 'graphql' do
      r.post do
        # params = JSON.parse(request.body.read)
        # result = Schema.execute(
        #   params['query'],
        #   variables: params['variables']
        # )

        # response['Content-Type'] = 'application/json; charset=utf-8'
        # result.to_json
        { result: 'result' }
      end
    end
  end
end
