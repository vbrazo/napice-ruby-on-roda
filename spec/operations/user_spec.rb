RSpec.describe Api::Operations::User do
  describe '#user' do
    let(:user) do
      {
        'email' => Faker::Internet.email
      }
    end

    it 'adds record successfully' do
      expect { subject.create(user: user) }.to(change { Api::Models::User.count })
    end
  end
end
