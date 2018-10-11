RSpec.describe Api::Operations::Company do
  describe '#demo' do
    let(:company) do
      {
        'first_name' => Faker::Name.first_name,
        'last_name' => Faker::Name.last_name,
        'email' => Faker::Internet.email,
        'phone' => Faker::PhoneNumber.cell_phone,
        'company_name' => Faker::Company.name,
        'company_website' => Faker::Internet.url
      }
    end

    it 'adds record successfully' do
      expect { subject.demo(company: company) }.to(change { Api::Models::Demo.count })
    end
  end
end
  