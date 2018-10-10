RSpec.describe Api::Operations::User::Create do
  let(:user) do
    {
      'email' => Faker::Internet.email
    }
  end

  subject { described_class.new(user: user) }

  it 'adds record successfully' do
    expect { subject.create }.to(change { Api::Models::User.count })
  end
end
