RSpec.describe 'POST #create_user' do
  let(:user) do
    {
      email: Faker::Internet.email
    }
  end

  context 'create a new user' do
    it 'should insert new user info correctly', :aggregate_failures do
      aggregate_failures 'successful_response' do
        post 'user/create', query: user

        expect(last_response.status).to eq(200)
        expect(response_body).to have_key(:success)
      end

      aggregate_failures 'correct_info' do
        new_user = Api::Models::User.last

        expect(new_user.email).to eq(user[:email])
      end
    end
  end
end
