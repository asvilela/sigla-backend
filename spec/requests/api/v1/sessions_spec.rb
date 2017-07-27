require 'rails_helper'

RSpec.describe 'Sessions API', type: :request do

  ######################################################################################### 
  # TEST PARAMETERS
  #########################################################################################
  before { host! "api.sigla.dev" }
  
  let(:user) { create(:user) }
  let(:headers) do
    {
      'Accept' => 'application/vnd.sigla.v1',
      'Content-Type' => Mime[:json].to_s
    }
  end

  ######################################################################################### 
  # POST SESSION
  #########################################################################################
  describe 'POST /sessions' do
    before do
      post "/sessions", params: { session: credentials }.to_json, headers: headers
    end

    context 'Credentials is valid' do
      let(:credentials) { { email: user.email, password: '123456' } }

      it 'Returns status code OK' do
        expect(response).to have_http_status(200)
      end

      it 'Returns authentication token' do
        expect(json_body[:authentication_token]).to eq(user.authentication_token)
      end
    end

    context 'Credentials is invalid' do
      let(:credentials) { { email: user.email, password: 'invalid_pass' } }

      it 'Returns status code Unauthorized' do
        expect(response).to have_http_status(401)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end

    end
  end


  ######################################################################################### 
  # DESTROY SESSION
  #########################################################################################
  describe 'DELETE /sessions/:id' do
    let(:authentication_token) { user.authentication_token }

    before do
      delete "/sessions/#{authentication_token}", params: {}, headers: headers
    end

    context 'Credentials is valid' do
      it 'Returns status code No Content' do
        expect(response).to have_http_status(204)
      end

      it 'Change user token' do
        expect( User.find_by(authentication_token: authentication_token) ).to be_nil
      end
    end

    context 'Credentials is invalid' do
      let(:authentication_token) { '123456789' }

      it 'Returns status code Unauthorized' do
        expect(response).to have_http_status(401)
      end
    end

  end

end