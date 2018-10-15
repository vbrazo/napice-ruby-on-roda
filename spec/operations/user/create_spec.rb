RSpec.describe Api::Operations::User::Create do
  describe '#create' do
    let(:user) do
      {
        'email' => Faker::Internet.email
      }
    end

    it 'adds record successfully' do
      expect do
        subject.call(user_hash: user)
      end.to(change { Api::Models::User.count }.by(1))
    end
  end
end
