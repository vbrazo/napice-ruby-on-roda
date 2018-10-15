class ApiSupport
  route do |r|
    r.on 'user' do
      r.on 'create' do
        r.post do
          Api::Operations::User::Create.new.call(user_hash: format_params['query'])
        end
      end
    end

    r.on 'company' do
      r.on 'demo' do
        r.post do
          Api::Operations::Company::Demo.new.call(company_hash: format_params['query'])
        end
      end
    end

    r.on 'napicer' do
      r.on 'index' do
        r.get do
          Api::Operations::Napicer::ShowAll.new.call
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

  def format_params
    request.params
  end
end
