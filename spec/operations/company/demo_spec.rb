RSpec.describe Api::Operations::Company::Demo do
  let(:user) do
    {
      'first_name' => Faker::Name.first_name,
      'last_name' => Faker::Name.last_name,
      'email' => Faker::Internet.email,
      'phone' => Faker::PhoneNumber.cell_phone,
      'company_name' => Faker::Company.name,
      'company_website' => Faker::Internet.url
    }
  end

  subject { described_class.new(demo: user) }

  it 'adds record successfully' do
    expect { subject.create }.to(change { Api::Models::Demo.count })
  end
end
