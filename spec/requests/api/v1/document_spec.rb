require 'rails_helper'

RSpec.describe 'Document API', type: :request do

  ######################################################################################### 
  # TEST PARAMETERS
  #########################################################################################
  before { host! "localhost" }
  
  let!(:document) { create(:document) }
  let(:document_id) { document.id }
  let(:headers) do 
    {
      'Content-Type' => Mime[:json].to_s
    }
  end

  ######################################################################################### 
  # SHOW DOCUMENT
  #########################################################################################
  describe 'GET /documents/:id' do
    before do
      get "/documents/#{document_id}", params: {}, headers: headers
    end

    context 'When the document exists' do
      it 'Retuns document id' do
        expect(json_body[:id]).to eq(document_id)
      end
      it 'Returns status code OK' do
        expect(response).to have_http_status(200)
      end
    end
    
  end

  ######################################################################################### 
  # CREATE DOCUMENT
  #########################################################################################  
  describe 'POST /documents' do
    before do
      post "/documents", params: { document: document_params }.to_json, headers: headers
    end

    context 'When the request is valid' do
      let(:document_params) { attributes_for(:document) }
      
      it 'Returns status code Created' do
        expect(response).to have_http_status(201)
        expect(json_body[:title]).to eq(document_params[:title])
      end
    end

    context 'When the request is invalid' do
      let(:document_params) { attributes_for(:document, title: nil) }

      it 'Returns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end
  end

  # ######################################################################################### 
  # UPDATE DOCUMENT
  #########################################################################################
  describe 'PUT /documents/:id' do
    before do
      put "/documents/#{document_id}", params: { document: document_params }.to_json, headers: headers
    end

    context 'When the request is valid' do
      let(:document_params) { { title: 'alter document title' } }

      it 'Retuns status code OK' do
        expect(response).to have_http_status(200)
      end

      it 'Returns entity' do
        expect(json_body[:title]).to eq(document_params[:title])
      end
    end

    context 'When the request is invalid' do
      let(:document_params) { { title: nil } }

      it 'retuns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end

  end

  ######################################################################################### 
  # DESTROY DOCUMENT
  #########################################################################################  
  describe 'DELETE /documents/:id' do
    before do
      delete "/documents/#{document_id}", params: {}, headers: headers
    end

    context 'When the request is valid' do
      it 'Return status code No Content' do
        expect(response).to have_http_status(204)
      end

      it 'User removed' do
        expect( Document.find_by(id: document_id) ).to be_nil
      end
    end
  end

end