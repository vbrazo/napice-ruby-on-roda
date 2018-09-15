RSpec.describe Api::Operations::User::Create do
  let(:args) do
    {
      'first_name' => Faker::Name.first_name,
      'last_name' => Faker::Name.last_name,
      'username' => Faker::Lorem.word,
      'email' => Faker::Internet.email
    }
  end

  subject { described_class.new(args) }

  it 'adds record successfully' do
    expect { subject.create }.to(change { Api::Models::User.count })
  end
end
