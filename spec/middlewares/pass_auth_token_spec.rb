require 'spec_helper'

# rubocop:disable Metrics/LineLength
RSpec.describe PassAuthToken do
  let(:rack_response) { ->(_env) { [200, {}, []] } }
  let(:middleware) { PassAuthToken.new(rack_response) }
  let(:mock_request) { Rack::MockRequest.new(middleware) }

  context 'incoming request has no Authorization header' do
    let(:resp) { mock_request.get('/') }

    it('returns a 401') { expect(resp.status).to eq 401 }

    it 'notifies the client they are Unauthorized' do
      expect(resp.body).to eq('Unauthorized!')
    end
  end

  context 'incoming request has a Authorization header' do
    context 'when incoming request has a Authorization header' do
      context 'but is missing an OAuth Authorization scheme' do
        let(:header_with_bad_scheme) { { 'HTTP_AUTHORIZATION' => 'Force' } }
        let(:resp) { mock_request.get('/', header_with_bad_scheme) }

        it('returns a 401') { expect(resp.status).to eq(401) }

        it 'notifies client that they sent the wrong Authorization scheme' do
          expect(resp.body).to eq('Unauthorized!')
        end
      end

      context 'but is missing an oauth_consumer_key' do
        let(:header_with_no_key) { { 'HTTP_AUTHORIZATION' => 'OAuth realm="Endor"' } }
        let(:resp) { mock_request.get('/', header_with_no_key) }

        it('returns a 401') { expect(resp.status).to eq(401) }

        it 'notifies the client that they have not included a consumer key' do
          expect(resp.body).to eq('Unauthorized!')
        end
      end

      context 'but is missing an oauth_signature' do
        let(:header_without_sig) do
          {
            'HTTP_AUTHORIZATION' => 'OAuth realm="foo", oauth_consumer_key="123"'
          }
        end
        let(:resp) { mock_request.get('/', header_without_sig) }

        it('returns a 401') { expect(resp.status).to eq(401) }

        it 'notifies the client that they have not signed the request' do
          expect(resp.body).to eq('Unauthorized!')
        end
      end

      context 'but is missing an oauth_signature_method' do
        let(:header_without_sig_method) do
          {
            'HTTP_AUTHORIZATION' => 'OAuth realm="foo", oauth_consumer_key="123", oauth_signature="SIGNATURE"'
          }
        end
        let(:resp) { mock_request.get('/', header_without_sig_method) }

        it('returns a 401') { expect(resp.status).to eq(401) }

        it "notifies the client that they haven't specified how they signed the request" do
          expect(resp.body).to eq('Unauthorized!')
        end
      end
    end

    context 'client makes request with sufficient, but incorrect OAuth header' do
      let(:test_uri) { 'http://api.deathstar.com' }
      let(:incorrect_secret) { "!!#{Client::DUMMY_SECRET}!!" }
      let(:incorrect_consumer_credentials) { { consumer_key: Client::DUMMY_KEY, consumer_secret: incorrect_secret } }
      let(:client_with_correct_credentials) { Client.new(Client::DUMMY_KEY, Client::DUMMY_SECRET) }
      let(:resp) { mock_request.get(test_uri, invalid_auth_header) }
      let(:invalid_auth_header) do
        {
          'HTTP_AUTHORIZATION' => SimpleOAuth::Header.new(:get, test_uri, {}, incorrect_consumer_credentials).to_s
        }
      end

      before { expect(Client).to receive(:find_by_consumer_key).and_return(client_with_correct_credentials) }

      it('returns a status of 401') { expect(resp.status).to eq(401) }

      it 'notifies the client that they have failed at thwarting the Imperials' do
        expect(resp.body).to eq('Unauthorized!')
      end
    end

    context 'client makes request with sufficient and correct OAuth header' do
      let(:test_uri) { 'http://example.com' }
      let(:consumer_credentials) { { consumer_key: Client::DUMMY_KEY, consumer_secret: Client::DUMMY_SECRET } }
      let(:valid_auth_header) do
        {
          'HTTP_AUTHORIZATION' => SimpleOAuth::Header.new(:get, test_uri, {}, consumer_credentials).to_s
        }
      end

      context 'GET without params' do
        let(:valid_auth_header) do
          {
            'HTTP_AUTHORIZATION' => SimpleOAuth::Header.new(:get, test_uri, {}, consumer_credentials).to_s
          }
        end

        it 'has a successful response' do
          resp = mock_request.get(test_uri, valid_auth_header)

          expect(resp.status).to eq(200)
        end
      end

      context 'GET with params' do
        let(:uri_with_params) { "#{test_uri}?foo=bar" }
        let(:valid_auth_header) do
          {
            'HTTP_AUTHORIZATION' => SimpleOAuth::Header.new(:get, uri_with_params, {}, consumer_credentials).to_s
          }
        end

        it 'has a successful response' do
          resp = mock_request.get(uri_with_params, valid_auth_header)

          expect(resp.status).to eq(200)
        end
      end

      context 'POST without params' do
        let(:valid_auth_header) do
          {
            'HTTP_AUTHORIZATION' => SimpleOAuth::Header.new(:post, test_uri, {}, consumer_credentials).to_s
          }
        end

        it 'has a successful response' do
          resp = mock_request.post(test_uri, valid_auth_header)

          expect(resp.status).to eq(200)
        end
      end

      context 'POST with params' do
        context 'Content-Type is x-www-form-urlencoded' do
          let(:form_data) { { foo: 'bar' } }
          let(:post_data) { { content_type: 'application/x-www-form-urlencoded', params: form_data } }
          let(:valid_auth_header) do
            {
              'HTTP_AUTHORIZATION' => SimpleOAuth::Header.new(:post, test_uri, form_data, consumer_credentials).to_s
            }
          end

          it 'has a successful response' do
            resp = mock_request.post(test_uri, valid_auth_header.merge(post_data))

            expect(resp.status).to eq(200)
          end
        end

        context 'Content-Type is anything other than x-www-form-urlencoded' do
          let(:json_data) { { foo: 'bar' }.to_json }
          let(:post_data) { { 'CONTENT_TYPE' => 'application/json', :input => json_data } }
          let(:valid_auth_header) do
            {
              'HTTP_AUTHORIZATION' => SimpleOAuth::Header.new(:post, test_uri, {}, consumer_credentials).to_s
            }
          end

          it 'has a successful response' do
            resp = mock_request.post(test_uri, valid_auth_header.merge(post_data))

            expect(resp.status).to eq(200)
          end
        end
      end
    end
  end
end
# rubocop:enable Metrics/LineLength
