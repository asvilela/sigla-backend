require 'rails_helper'

RSpec.describe 'Companies API', type: :request do

  ######################################################################################### 
  # TEST PARAMETERS
  #########################################################################################
  before { host! "localhost" }
  
  let!(:company) { create(:company) }
  let(:company_id) { company.id }
  let(:headers) do 
    {
      'Content-Type' => Mime[:json].to_s
    }
  end

  ######################################################################################### 
  # SHOW COMPANY
  #########################################################################################
  describe 'GET /companies/:id' do
    before do
      get "/companies/#{company_id}", params: {}, headers: headers
    end

    context 'Company exists' do
      it 'Retuns company id' do
        expect(json_body[:id]).to eq(company_id)
      end
      it 'Returns status code OK' do
        expect(response).to have_http_status(200)
      end
    end
    
  end

  ######################################################################################### 
  # CREATE COMPANY
  #########################################################################################  
  describe 'POST /companies' do
    before do
      post "/companies", params: { company: company_params }.to_json, headers: headers
    end

    context 'Request is valid' do
      let(:company_params) { attributes_for(:company) }
      
      it 'Returns status code Created' do
        expect(response).to have_http_status(201)
        expect(json_body[:title]).to eq(company_params[:title])
      end
    end

    context 'Request is invalid' do
      let(:company_params) { attributes_for(:company, cnpj: nil) }

      it 'Returns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end
  end

  ######################################################################################### 
  # UPDATE COMPANY
  #########################################################################################
  describe 'PUT /companies/:id' do
    before do
      put "/companies/#{company_id}", params: { company: company_params }.to_json, headers: headers
    end

    context 'Request is valid' do
      let(:company_params) { { company_name: 'alter company' } }

      it 'Retuns status code OK' do
        expect(response).to have_http_status(200)
      end

      it 'Returns entity' do
        expect(json_body[:company_name]).to eq(company_params[:company_name])
      end
    end

    context 'Request is invalid' do
      let(:company_params) { { company_name: nil } }

      it 'retuns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end

  end
  ######################################################################################### 
  # DESTROY COMPANY
  #########################################################################################  
  describe 'DELETE /companies/:id' do
    before do
      delete "/companies/#{company_id}", params: {}, headers: headers
    end

    context 'Request is valid' do
      it 'Return status code No Content' do
        expect(response).to have_http_status(204)
      end

      it 'User removed' do
        expect( Company.find_by(id: company_id) ).to be_nil
      end
    end
  end

end