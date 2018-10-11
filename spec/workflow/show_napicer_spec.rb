require 'spec_helper'

RSpec.describe 'GET #show' do
  context 'given valid params' do
    let(:napicer) { FactoryBot.create(:napicer) }
    let(:another_developers) { FactoryBot.create_list(:napicer, 20) }
    
    it 'should return a specific napicer correctly', :aggregate_failures do
      aggregate_failures 'successful_response' do
        get 'napicer/show', query: { id: napicer.id }

        expect(last_response.status).to eq(200)
      end

      aggregate_failures 'correct_info' do
        response = response_body

        expect(response.count).to be > 0
        expect(response[:id]).to eq(napicer.id)
        expect(response[:first_name]).to eq(napicer.first_name)
        expect(response[:last_name]).to eq(napicer.last_name)
        expect(response[:username]).to eq(napicer.username)
        expect(response[:avatar]).to eq(napicer.avatar)
        expect(response[:status]).to eq(napicer.status)
        expect(response[:nickname]).to eq(napicer.nickname)
        expect(response[:availability]).to eq(napicer.availability)
        expect(response[:desired_hourly_rate]).to eq(napicer.desired_hourly_rate)
        expect(response[:self_description]).to eq(napicer.self_description)
        expect(response[:mailing_address_1]).to eq(napicer.mailing_address_1)
        expect(response[:mailing_address_2]).to eq(napicer.mailing_address_2)
        expect(response[:phone]).to eq(napicer.phone)
        expect(response[:timezone]).to eq(napicer.timezone)
        expect(response[:city]).to eq(napicer.city)
        expect(response[:state_or_province]).to eq(napicer.state_or_province)
        expect(response[:postal_code]).to eq(napicer.postal_code)
        expect(response[:country]).to eq(napicer.country)
        expect(response[:skype]).to eq(napicer.skype)
        expect(response[:twitter]).to eq(napicer.twitter)
        expect(response[:github_username]).to eq(napicer.github_username)
        expect(response[:linkedin_url]).to eq(napicer.linkedin_url)
        expect(response[:current_employment_situation]).to eq(napicer.current_employment_situation)
        expect(response[:data_science]).to eq(napicer.data_science)
        expect(response[:development]).to eq(napicer.development)
        expect(response[:devops]).to eq(napicer.devops)
        expect(response[:design]).to eq(napicer.design)
        expect(response[:management]).to eq(napicer.management)
        expect(response[:storage]).to eq(napicer.storage)
        expect(response[:others]).to eq(napicer.others)
        expect(response[:introduction]).to eq(napicer.introduction)
        expect(response[:nationality]).to eq(napicer.nationality)
        expect(response[:position]).to eq(napicer.position)
        expect(response[:created_at]).to eq(napicer.created_at)
        expect(response[:updated_at]).to eq(napicer.updated_at)
      end
    end
  end
end
