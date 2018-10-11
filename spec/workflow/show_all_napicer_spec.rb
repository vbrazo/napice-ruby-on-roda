require 'spec_helper'

RSpec.describe 'GET #show_all' do
  context 'given valid params' do
    let(:napicer) { FactoryBot.create(:napicer) }
    let(:another_developers) { FactoryBot.create_list(:napicer, 20) }

    it 'should return all the napicers correctly', :aggregate_failures do
      aggregate_failures 'successful_response' do
        get 'napicer/index'

        expect(last_response.status).to eq(200)
      end

      aggregate_failures 'correct_info' do
        expect(response_body.count).to be > 0
      end
    end
  end
end
