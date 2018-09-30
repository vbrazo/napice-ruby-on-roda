require 'spec_helper'

RSpec.describe 'POST #create_user' do
  let(:admin_user) { FactoryBot.create(:user) }
  let(:user) do
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      username: Faker::Lorem.word,
      email: Faker::Internet.email
    }
  end

  context 'create a new user' do
    it 'should insert new user info correctly', :aggregate_failures do
      aggregate_failures 'successful_response' do
        login_as admin_user
        post 'user/create', query: user

        expect(last_response.status).to eq(200)
      end

      aggregate_failures 'correct_info' do
        new_user = Api::Models::User.last

        expect(new_user.first_name).to eq(user[:first_name])
        expect(new_user.last_name).to eq(user[:last_name])
        expect(new_user.username).to eq(user[:username])
        expect(new_user.email).to eq(user[:email])
      end
    end
  end
end
