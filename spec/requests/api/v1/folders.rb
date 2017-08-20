require 'rails_helper'

RSpec.describe 'Folders API', type: :request do

  ######################################################################################### 
  # TEST PARAMETERS
  #########################################################################################
  before { host! "localhost" }
  
  let!(:folder) { create(:folder) }
  let(:folder_id) { folder.id }
  let(:headers) do 
    {
      'Content-Type' => Mime[:json].to_s
    }
  end

  ######################################################################################### 
  # SHOW FOLDER
  #########################################################################################
  describe 'GET /folders/:id' do
    before do
      get "/folders/#{folder_id}", params: {}, headers: headers
    end

    context 'When the folder exists' do
      it 'Retuns folder id' do
        expect(json_body[:id]).to eq(folder_id)
      end
      it 'Returns status code OK' do
        expect(response).to have_http_status(200)
      end
    end
    
  end

  ######################################################################################### 
  # CREATE FOLDER
  #########################################################################################  
  describe 'POST /folders' do
    before do
      post "/folders", params: { folder: folder_params }.to_json, headers: headers
    end

    context 'When the request is valid' do
      let(:folder_params) { attributes_for(:folder) }
      
      it 'Returns status code Created' do
        expect(response).to have_http_status(201)
        expect(json_body[:title]).to eq(folder_params[:title])
      end
    end

    context 'When the request is invalid' do
      let(:folder_params) { attributes_for(:folder, title: nil) }

      it 'Returns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end
  end

  # ######################################################################################### 
  # UPDATE FOLDER
  #########################################################################################
  describe 'PUT /folders/:id' do
    before do
      put "/folders/#{folder_id}", params: { folder: folder_params }.to_json, headers: headers
    end

    context 'When the request is valid' do
      let(:folder_params) { { title: 'alter folder title' } }

      it 'Retuns status code OK' do
        expect(response).to have_http_status(200)
      end

      it 'Returns entity' do
        expect(json_body[:title]).to eq(folder_params[:title])
      end
    end

    context 'When the request is invalid' do
      let(:folder_params) { { title: nil } }

      it 'retuns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end

  end

  ######################################################################################### 
  # DESTROY FOLDER
  #########################################################################################  
  describe 'DELETE /folders/:id' do
    before do
      delete "/folders/#{folder_id}", params: {}, headers: headers
    end

    context 'When the request is valid' do
      it 'Return status code No Content' do
        expect(response).to have_http_status(204)
      end

      it 'User removed' do
        expect( Folder.find_by(id: folder_id) ).to be_nil
      end
    end
  end

end