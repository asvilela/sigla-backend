require 'rails_helper'

RSpec.describe 'Document API', type: :request do

  ######################################################################################### 
  # TEST PARAMETERS
  #########################################################################################
  before { host! "localhost" }
  
  let!(:task) { create(:task) }
  let(:task_id) { task.id }
  let(:headers) do 
    {
      'Content-Type' => Mime[:json].to_s
    }
  end

  ######################################################################################### 
  # SHOW TASK
  #########################################################################################
  describe 'GET /tasks/:id' do
    before do
      get "/tasks/#{task_id}", params: {}, headers: headers
    end

    context 'When the task exists' do
      it 'Retuns task id' do
        expect(json_body[:id]).to eq(task_id)
      end
      it 'Returns status code OK' do
        expect(response).to have_http_status(200)
      end
    end
    
  end

  ######################################################################################### 
  # CREATE TASK
  #########################################################################################  
  describe 'POST /tasks' do
    before do
      post "/tasks", params: { task: task_params }.to_json, headers: headers
    end

    context 'When the request is valid' do
      let(:task_params) { attributes_for(:task) }
      
      it 'Returns status code Created' do
        expect(response).to have_http_status(201)
        expect(json_body[:title]).to eq(task_params[:title])
      end
    end

    context 'When the request is invalid' do
      let(:task_params) { attributes_for(:task, title: nil) }

      it 'Returns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end
    
  end

  # ######################################################################################### 
  # UPDATE TASK
  #########################################################################################
  describe 'PUT /tasks/:id' do
    before do
      put "/tasks/#{task_id}", params: { task: task_params }.to_json, headers: headers
    end

    context 'When the request is valid' do
      let(:task_params) { { title: 'alter task title' } }

      it 'Retuns status code OK' do
        expect(response).to have_http_status(200)
      end

      it 'Returns entity' do
        expect(json_body[:title]).to eq(task_params[:title])
      end
    end

    context 'When the request is invalid' do
      let(:task_params) { { title: nil } }

      it 'retuns status code Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end

  end

  ######################################################################################### 
  # DESTROY TASK
  #########################################################################################  
  describe 'DELETE /tasks/:id' do
    before do
      delete "/tasks/#{task_id}", params: {}, headers: headers
    end

    context 'When the request is valid' do
      it 'Return status code No Content' do
        expect(response).to have_http_status(204)
      end

      it 'User removed' do
        expect( Task.find_by(id: task_id) ).to be_nil
      end
    end
  end

end