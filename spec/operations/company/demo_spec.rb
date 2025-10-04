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

    it 'returns success status' do
      result = subject.call(company_hash: company)
      expect(result).to eq({ success: true })
    end

    context 'with invalid input' do
      it 'raises error when company_hash is nil' do
        expect do
          subject.call(company_hash: nil)
        end.to raise_error(ArgumentError, 'company_hash cannot be empty')
      end

      it 'raises error when company_hash is empty' do
        expect do
          subject.call(company_hash: {})
        end.to raise_error(ArgumentError, 'company_hash cannot be empty')
      end
    end

    context 'with missing required fields' do
      it 'raises validation error' do
        expect do
          subject.call(company_hash: { 'first_name' => 'Test' })
        end.to raise_error(Sequel::ValidationFailed)
      end
    end
  end
end
