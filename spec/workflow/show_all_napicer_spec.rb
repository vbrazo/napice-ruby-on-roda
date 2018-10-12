RSpec.describe 'GET #show_all' do
  context 'given valid params' do
    before { create_list(:napicer, 20) }

    it 'should return all the napicers correctly', :aggregate_failures do
      aggregate_failures 'successful_response' do
        get 'napicer/index'

        expect(last_response.status).to eq(200)
        expect(response_body.count).to eq(20)
      end
    end
  end
end
