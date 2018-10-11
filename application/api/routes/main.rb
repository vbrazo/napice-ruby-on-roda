class ApiSupport
  route do |r|
    r.root do
      'Nothing Here'
    end

    r.on 'user' do
      r.on 'create' do
        r.post do
          user_operation.create(user: format_params['query']).to_json
        end
      end
    end

    r.on 'company' do
      r.on 'demo' do
        r.post do
          company_operation.demo(company: format_params['query']).to_json
        end
      end
    end

    r.on 'napicer' do
      r.on 'index' do
        r.get do
          napicer_operation.show_all
        end
      end

      r.on 'show' do
        r.get do
          napicer_operation.show(napicer: format_params['query']).to_json
        end
      end
    end
  end

  def format_params
    request.params
  rescue StandardError
    JSON.parse(request.body.read)
  end

  private

  def company_operation
    @company_operation ||= Api::Operations::Company.new
  end

  def napicer_operation
    @napicer_operation ||= Api::Operations::Napicer.new
  end

  def user_operation
    @user_operation ||= Api::Operations::User.new
  end
end
