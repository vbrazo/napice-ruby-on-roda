RSpec.describe Api::Operations::Company::Demo do
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
      expect do
        subject.call(company_hash: company)
      end.to(change { Api::Models::Demo.count }.by(1))
    end
  end
end
