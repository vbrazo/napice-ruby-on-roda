RSpec.describe Api::Controllers::User do
  describe '#user' do
    let(:user) do
      {
        'email' => Faker::Internet.email
      }
    end

    it 'adds record successfully' do
      expect do
        subject.create(user: user)
      end.to(change { Api::Models::User.count }.by(1))
    end
  end
end
