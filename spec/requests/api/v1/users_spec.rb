require 'rails_helper'

RSpec.describe 'Users API', type: :request do

  ######################################################################################### 
  # TEST PARAMETERS
  #########################################################################################
  before { host! "api.sigla.dev" }
  
  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:headers) do
    {
      'Accept' => 'application/vnd.sigla.v1',
      'Content-Type' => Mime[:json].to_s
    }
  end

  ######################################################################################### 
  # SHOW USER
  #########################################################################################
  describe 'GET /users/:id' do
    before do
      get "/users/#{user_id}", params: {}, headers: headers
    end

    context 'User exists' do
      it 'Retuns user id' do
        expect(json_body[:id]).to eq(user_id)
      end
      it 'Returns status code OK' do
        expect(response).to have_http_status(200)
      end
    end

    context 'User not exists' do
      let(:user_id) { 10000 }
      
      it 'Return status code Not Found' do
        # expect(response).to have_http_status(404)

        expect(response).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  ######################################################################################### 
  # CREATE USER
  #########################################################################################
  describe 'POST /users' do
    before do
      post "/users", params: { user: user_params }.to_json, headers: headers
    end
    
    context 'Request is valid' do
      let(:user_params) { attributes_for(:user) }
      
      it 'Returns status code Created' do
        expect(response).to have_http_status(201)
        expect(json_body[:email]).to eq(user_params[:email])
      end
    end

    context 'Request is invalid' do
      let(:user_params) { attributes_for(:user, email: 'invalid_email@') }

      it 'Returns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end

  end

  ######################################################################################### 
  # UPDATE USER
  #########################################################################################
  describe 'PUT /users/:id' do
    before do
      put "/users/#{user_id}", params: { user: user_params }.to_json, headers: headers
    end

    context 'Request is valid' do
      let(:user_params) { { email: 'novoemail@teste.com' } }

      it 'Retuns status code OK' do
        expect(response).to have_http_status(200)
      end

      it 'Returns entity' do
        expect(json_body[:email]).to eq(user_params[:email])
      end
    end

    context 'Request is invalid' do
      let(:user_params) { { email: 'invalid_email@' } }

      it 'retuns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end
  end

  ######################################################################################### 
  # DESTROY USER
  #########################################################################################
  describe 'DELETE /users/:id' do
    before do
      delete "/users/#{user_id}", params: {}, headers: headers
    end

    context 'Request is valid' do
      it 'Return status code No Content' do
        expect(response).to have_http_status(204)
      end

      it 'User removed' do
        expect( User.find_by(id: user_id) ).to be_nil
      end
    end
  end

end