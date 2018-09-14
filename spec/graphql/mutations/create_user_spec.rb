require 'spec_helper'

RSpec.describe UserMutations do
  let(:email) { Faker::Internet.email }
  let(:first_name) { Faker::Name.first_name }
  let(:last_name) { Faker::Name.last_name }
  let(:username) { Faker::Lorem.word }
  let(:query_string) do
    "mutation {
      create_user(
        input: {
          first_name: \"#{first_name}\",
          last_name: \"#{last_name}\",
          username: \"#{username}\",
          email: \"#{email}\",
      })
      {
        id
      }
    }"
  end
  let(:id) { { id: 0 } }
  let(:input) do
    {
      first_name: first_name,
      last_name: last_name,
      username: username,
      email: email
    }
  end
  let(:result) do
    Schema.execute(query_string, context: { current_user: double })
  end

  context 'with valid params' do
    let(:result_data) { { data: { create_user: id } }.deep_stringify_keys }

    before do
      expect(Api::Models::User).to receive(:create).with(input).and_return(id)
    end

    it 'invokes the User::Create operation' do
      expect(result).to match(result_data)
    end
  end
end
