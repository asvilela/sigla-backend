require 'rails_helper'

RSpec.describe 'Document API', type: :request do

  ######################################################################################### 
  # TEST PARAMETERS
  #########################################################################################
  before { host! "localhost" }
  
  let!(:conditional) { create(:conditional) }
  let(:conditional_id) { conditional.id }
  let(:headers) do 
    {
      'Content-Type' => Mime[:json].to_s
    }
  end

  ######################################################################################### 
  # SHOW CONDITIONAL
  #########################################################################################
  describe 'GET /conditionals/:id' do
    before do
      get "/conditionals/#{conditional_id}", params: {}, headers: headers
    end

    context 'When the conditional exists' do
      it 'Retuns conditional id' do
        expect(json_body[:id]).to eq(conditional_id)
      end
      it 'Returns status code OK' do
        expect(response).to have_http_status(200)
      end
    end
    
  end

  ######################################################################################### 
  # CREATE CONDITIONAL
  #########################################################################################  
  describe 'POST /conditionals' do
    before do
      post "/conditionals", params: { conditional: conditional_params }.to_json, headers: headers
    end

    context 'When the request is valid' do
      let(:conditional_params) { attributes_for(:conditional) }
      
      it 'Returns status code Created' do
        expect(response).to have_http_status(201)
        expect(json_body[:title]).to eq(conditional_params[:title])
      end
    end

    context 'When the request is invalid' do
      let(:conditional_params) { attributes_for(:conditional, title: nil) }

      it 'Returns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end
  end

  # ######################################################################################### 
  # UPDATE CONDITIONAL
  #########################################################################################
  describe 'PUT /conditionals/:id' do
    before do
      put "/conditionals/#{conditional_id}", params: { conditional: conditional_params }.to_json, headers: headers
    end

    context 'When the request is valid' do
      let(:conditional_params) { { title: 'alter conditional title' } }

      it 'Retuns status code OK' do
        expect(response).to have_http_status(200)
      end

      it 'Returns entity' do
        expect(json_body[:title]).to eq(conditional_params[:title])
      end
    end

    context 'When the request is invalid' do
      let(:conditional_params) { { title: nil } }

      it 'retuns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end

  end

  ######################################################################################### 
  # DESTROY CONDITIONAL
  #########################################################################################  
  describe 'DELETE /conditionals/:id' do
    before do
      delete "/conditionals/#{conditional_id}", params: {}, headers: headers
    end

    context 'When the request is valid' do
      it 'Return status code No Content' do
        expect(response).to have_http_status(204)
      end

      it 'User removed' do
        expect( Conditional.find_by(id: conditional_id) ).to be_nil
      end
    end
  end

end