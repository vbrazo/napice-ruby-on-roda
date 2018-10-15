class ApiSupport
  route do |r|
    r.on 'user' do
      r.on 'create' do
        r.post do
          user_operation = Api::Operations::User::Create.new

          user_operation.call(user_hash: format_params['query'])
        end
      end
    end

    r.on 'company' do
      r.on 'demo' do
        r.post do
          company_operation = Api::Operations::Company::Demo.new

          company_operation.call(company_hash: format_params['query'])
        end
      end
    end

    r.on 'napicer' do
      r.on 'index' do
        r.get do
          napicer_operation = Api::Operations::Napicer::ShowAll.new

          napicer_operation.call
        end
      end

      r.on 'show' do
        r.get do
          napicer_operation = Api::Operations::Napicer::Show.new

          JSON(napicer_operation.call(napicer_hash: format_params['query']))
        end
      end
    end
  end

  private

  def format_params
    request.params
  end
end
