require 'rails_helper'

RSpec.describe 'Enterprises API', type: :request do

  ######################################################################################### 
  # TEST PARAMETERS
  #########################################################################################
  before { host! "localhost" }
  
  let!(:enterprise) { create(:enterprise) }
  let(:enterprise_id) { enterprise.id }
  let(:headers) do 
    {
      'Content-Type' => Mime[:json].to_s
    }
  end

  ######################################################################################### 
  # SHOW ENTERPRISE
  #########################################################################################
  describe 'GET /enterprises/:id' do
    before do
      get "/enterprises/#{enterprise_id}", params: {}, headers: headers
    end

    context 'When the interprise exists' do
      it 'Retuns company id' do
        expect(json_body[:id]).to eq(enterprise_id)
      end
      it 'Returns status code OK' do
        expect(response).to have_http_status(200)
      end
    end
    
  end

  ######################################################################################### 
  # CREATE ENTERPRISE
  #########################################################################################  
  describe 'POST /enterprises' do
    before do
      post "/enterprises", params: { enterprise: enterprise_params }.to_json, headers: headers
    end

    context 'When the request is valid' do
      let(:enterprise_params) { attributes_for(:enterprise) }
      
      it 'Returns status code Created' do
        expect(response).to have_http_status(201)
        expect(json_body[:title]).to eq(enterprise_params[:title])
      end
    end

    context 'When the request is invalid' do
      let(:enterprise_params) { attributes_for(:enterprise, title: nil) }

      it 'Returns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end
  end

  ######################################################################################### 
  # UPDATE ENTERPRISE
  #########################################################################################
  describe 'PUT /enterprises/:id' do
    before do
      put "/enterprises/#{enterprise_id}", params: { enterprise: enterprise_params }.to_json, headers: headers
    end

    context 'When the request is valid' do
      let(:enterprise_params) { { title: 'alter enterprise title' } }

      it 'Retuns status code OK' do
        expect(response).to have_http_status(200)
      end

      it 'Returns entity' do
        expect(json_body[:title]).to eq(enterprise_params[:title])
      end
    end

    context 'When the request is invalid' do
      let(:enterprise_params) { { title: nil } }

      it 'retuns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end

  end

  ######################################################################################### 
  # DESTROY ENTERPRISE
  #########################################################################################  
  describe 'DELETE /enterprises/:id' do
    before do
      delete "/enterprises/#{enterprise_id}", params: {}, headers: headers
    end

    context 'When the request is valid' do
      it 'Return status code No Content' do
        expect(response).to have_http_status(204)
      end

      it 'User removed' do
        expect( Enterprise.find_by(id: enterprise_id) ).to be_nil
      end
    end
  end

end