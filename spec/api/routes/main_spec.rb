RSpec.describe 'API Routes' do
  describe 'Error handling' do
    context 'when route does not exist' do
      it 'returns 404 status' do
        get '/non_existent_route'

        expect(last_response.status).to eq(404)
        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to eq('Route not found')
      end
    end
  end

  describe 'POST /user/create' do
    context 'with valid parameters' do
      let(:user_params) do
        {
          query: {
            email: Faker::Internet.email
          }
        }
      end

      it 'creates a new user successfully' do
        expect do
          post 'user/create', user_params
        end.to(change { Api::Models::User.count }.by(1))

        expect(last_response.status).to eq(200)
      end
    end

    context 'with missing query parameters' do
      it 'returns 400 status' do
        post 'user/create'

        expect(last_response.status).to eq(400)
        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to eq('Missing query parameters')
      end
    end

    context 'with invalid email' do
      let(:invalid_params) do
        {
          query: {
            email: 'invalid_email'
          }
        }
      end

      it 'returns 422 status with validation error' do
        post 'user/create', invalid_params

        expect(last_response.status).to eq(422)
        expect(response_body).to have_key(:error)
      end
    end

    context 'with duplicate email' do
      let(:user_params) do
        {
          query: {
            email: 'test@example.com'
          }
        }
      end

      before do
        Api::Models::User.create(email: 'test@example.com')
      end

      it 'returns 422 status with validation error' do
        post 'user/create', user_params

        expect(last_response.status).to eq(422)
        expect(response_body).to have_key(:error)
      end
    end
  end

  describe 'POST /company/demo' do
    context 'with valid parameters' do
      let(:demo_params) do
        {
          query: {
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email: Faker::Internet.email,
            phone: Faker::PhoneNumber.phone_number,
            company_name: Faker::Company.name,
            company_website: Faker::Internet.url
          }
        }
      end

      it 'creates a new demo request successfully' do
        expect do
          post 'company/demo', demo_params
        end.to(change { Api::Models::Demo.count }.by(1))

        expect(last_response.status).to eq(200)
      end
    end

    context 'with missing query parameters' do
      it 'returns 400 status' do
        post 'company/demo'

        expect(last_response.status).to eq(400)
        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to eq('Missing query parameters')
      end
    end
  end

  describe 'GET /napicer/index' do
    context 'when napicers exist' do
      let!(:user) { create(:user) }
      let!(:napicer) { create(:napicer, user_id: user.id) }

      it 'returns all napicers' do
        get 'napicer/index'

        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to be_an(Array)
        expect(JSON.parse(last_response.body).length).to be >= 1
      end
    end

    context 'when no napicers exist' do
      it 'returns empty array' do
        get 'napicer/index'

        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq([])
      end
    end
  end

  describe 'GET /napicer/show' do
    let!(:user) { create(:user) }
    let!(:napicer) { create(:napicer, user_id: user.id) }

    context 'with valid id' do
      it 'returns the napicer' do
        get 'napicer/show', query: { id: napicer.id }

        expect(last_response.status).to eq(200)
        body = JSON.parse(last_response.body, symbolize_names: true)
        expect(body[:id]).to eq(napicer.id)
      end
    end

    context 'with invalid id' do
      it 'returns 404 status' do
        get 'napicer/show', query: { id: 99999 }

        expect(last_response.status).to eq(404)
        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to eq('Napicer not found')
      end
    end

    context 'without id parameter' do
      it 'returns 400 status' do
        get 'napicer/show'

        expect(last_response.status).to eq(400)
        expect(response_body).to have_key(:error)
        expect(response_body[:error]).to eq('Missing id parameter')
      end
    end
  end
end

