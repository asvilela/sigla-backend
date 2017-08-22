require 'rails_helper'

RSpec.describe 'Document API', type: :request do

  ######################################################################################### 
  # TEST PARAMETERS
  #########################################################################################
  before { host! "localhost" }
  
  let!(:evidence) { create(:evidence) }
  let(:evidence_id) { evidence.id }
  let(:headers) do 
    {
      'Content-Type' => Mime[:json].to_s
    }
  end

  ######################################################################################### 
  # SHOW EVIDENCE
  #########################################################################################
  describe 'GET /evidences/:id' do
    before do
      get "/evidences/#{evidence_id}", params: {}, headers: headers
    end

    context 'When the evidence exists' do
      it 'Retuns evidence id' do
        expect(json_body[:id]).to eq(evidence_id)
      end
      it 'Returns status code OK' do
        expect(response).to have_http_status(200)
      end
    end
    
  end

  ######################################################################################### 
  # CREATE EVIDENCE
  #########################################################################################  
  describe 'POST /evidences' do
    before do
      post "/evidences", params: { evidence: evidence_params }.to_json, headers: headers
    end

    context 'When the request is valid' do
      let(:evidence_params) { attributes_for(:evidence) }
      
      it 'Returns status code Created' do
        expect(response).to have_http_status(201)
        expect(json_body[:title]).to eq(evidence_params[:title])
      end
    end

    context 'When the request is invalid' do
      let(:evidence_params) { attributes_for(:evidence, title: nil) }

      it 'Returns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end
  end

  # ######################################################################################### 
  # UPDATE EVIDENCE
  #########################################################################################
  describe 'PUT /evidences/:id' do
    before do
      put "/evidences/#{evidence_id}", params: { evidence: evidence_params }.to_json, headers: headers
    end

    context 'When the request is valid' do
      let(:evidence_params) { { title: 'alter evidence title' } }

      it 'Retuns status code OK' do
        expect(response).to have_http_status(200)
      end

      it 'Returns entity' do
        expect(json_body[:title]).to eq(evidence_params[:title])
      end
    end

    context 'When the request is invalid' do
      let(:evidence_params) { { title: nil } }

      it 'retuns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end

  end

  ######################################################################################### 
  # DESTROY EVIDENCE
  #########################################################################################  
  describe 'DELETE /evidences/:id' do
    before do
      delete "/evidences/#{evidence_id}", params: {}, headers: headers
    end

    context 'When the request is valid' do
      it 'Return status code No Content' do
        expect(response).to have_http_status(204)
      end

      it 'User removed' do
        expect( Evidence.find_by(id: evidence_id) ).to be_nil
      end
    end
  end

end