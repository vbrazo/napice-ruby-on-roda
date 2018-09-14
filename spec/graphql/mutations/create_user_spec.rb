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
  let(:input) do
    {
      first_name: first_name,
      last_name: last_name,
      username: username,
      email: email,
      columns: {
        success: nil
      }
    }
  end
  let(:result) do
    Schema.execute(
      query_string,
      context: { current_user: double }
    )
  end
  let(:id) { { id: 0 } }

  context 'with valid params' do
    let(:result_data) { { data: { createUser: { success: true } } }.deep_stringify_keys }

    before do
      expect(Api::Operations::User::Create).to receive(:new) do |_ctx, args|
        expect(args).to match(input)
      end.and_return(id)
    end

    it 'invokes the User::create operation' do
      expect(result).to match(result_data)
    end
  end
end
