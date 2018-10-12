RSpec.describe 'POST #demo' do
  let(:demo) do
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone,
      company_name: Faker::Company.name,
      company_website: Faker::Internet.url
    }
  end

  context 'create a new demo' do
    it 'should schedule a new demo correctly', :aggregate_failures do
      aggregate_failures 'successful_response' do
        post 'company/demo', query: demo

        expect(last_response.status).to eq(200)
      end

      aggregate_failures 'correct_info' do
        new_demo = Api::Models::Demo.last

        expect(new_demo.first_name).to eq(demo[:first_name])
        expect(new_demo.last_name).to eq(demo[:last_name])
        expect(new_demo.email).to eq(demo[:email])
        expect(new_demo.phone).to eq(demo[:phone])
        expect(new_demo.company_name).to eq(demo[:company_name])
        expect(new_demo.company_website).to eq(demo[:company_website])
      end
    end
  end
end
