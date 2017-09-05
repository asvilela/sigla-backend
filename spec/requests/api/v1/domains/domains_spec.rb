require 'rails_helper'

RSpec.describe 'Domains API', type: :request do

  ######################################################################################### 
  # TEST PARAMETERS
  #########################################################################################
  before { host! "localhost" }
  
  let(:headers) do 
    {
      'Content-Type' => Mime[:json].to_s
    }
  end

  ######################################################################################### 
  # INDEX DOMAINS/ENTERPRISE_TYPES
  #########################################################################################

  describe 'GET /domains/enterprise_types' do
    let!(:enterprise_types) { create_list(:enterprise_type, 5) }

    before do
      get "/domains/enterprise_types", params: {}, headers: headers
    end

    it 'returns list of enterprise type' do
      expect(json_body.length).to eq(5)
    end
    
  end

  ######################################################################################### 
  # INDEX DOMAINS/FEATURES
  #########################################################################################

  describe 'GET /domains/features' do
    let!(:features) { create_list(:feature, 5) }

    before do
      get "/domains/features", params: {}, headers: headers
    end

    it 'returns list of enterprise type' do
      expect(json_body.length).to eq(5)
    end
    
  end

  ######################################################################################### 
  # INDEX DOMAINS/PHASES
  #########################################################################################

  describe 'GET /domains/phases' do
    let!(:phases) { create_list(:phase, 5) }

    before do
      get "/domains/phases", params: {}, headers: headers
    end

    it 'returns list of enterprise type' do
      expect(json_body.length).to eq(5)
    end
    
  end

  ######################################################################################### 
  # INDEX DOMAINS/CONTENT_TYPES
  #########################################################################################

  describe 'GET /domains/content_types' do
    let!(:content_types) { create_list(:content_type, 5) }

    before do
      get "/domains/content_types", params: {}, headers: headers
    end

    it 'returns list of enterprise type' do
      expect(json_body.length).to eq(5)
    end
    
  end

  ######################################################################################### 
  # INDEX DOMAINS/CONDITIONAL_STATUSES
  #########################################################################################

  describe 'GET /domains/conditional_statuses' do
    let!(:conditional_statuses) { create_list(:conditional_status, 5) }

    before do
      get "/domains/conditional_statuses", params: {}, headers: headers
    end

    it 'returns list of enterprise type' do
      expect(json_body.length).to eq(5)
    end
    
  end

  ######################################################################################### 
  # INDEX DOMAINS/CONDITIONAL_TYPES
  #########################################################################################

  describe 'GET /domains/conditional_types' do
    let!(:conditional_types) { create_list(:conditional_type, 5) }

    before do
      get "/domains/conditional_types", params: {}, headers: headers
    end

    it 'returns list of enterprise type' do
      expect(json_body.length).to eq(5)
    end
    
  end

  ######################################################################################### 
  # INDEX DOMAINS/RECURRENCE_TYPES
  #########################################################################################

  describe 'GET /domains/recurrence_types' do
    let!(:recurrence_types) { create_list(:recurrence_type, 5) }

    before do
      get "/domains/recurrence_types", params: {}, headers: headers
    end

    it 'returns list of enterprise type' do
      expect(json_body.length).to eq(5)
    end
    
  end
  
  ######################################################################################### 
  # INDEX DOMAINS/TASK_STATUSES
  #########################################################################################

  describe 'GET /domains/task_statuses' do
    let!(:task_statuses) { create_list(:task_status, 5) }

    before do
      get "/domains/task_statuses", params: {}, headers: headers
    end

    it 'returns list of enterprise type' do
      expect(json_body.length).to eq(5)
    end
    
  end

  ######################################################################################### 
  # INDEX DOMAINS/PRIORITIES
  #########################################################################################

  describe 'GET /domains/priorities' do
    let!(:priorities) { create_list(:priority, 5) }

    before do
      get "/domains/priorities", params: {}, headers: headers
    end

    it 'returns list of enterprise type' do
      expect(json_body.length).to eq(5)
    end
    
  end

  ######################################################################################### 
  # INDEX DOMAINS/EVIDENCE_TYPES
  #########################################################################################

  describe 'GET /domains/evidence_types' do
    let!(:evidence_types) { create_list(:evidence_type, 5) }

    before do
      get "/domains/evidence_types", params: {}, headers: headers
    end

    it 'returns list of enterprise type' do
      expect(json_body.length).to eq(5)
    end
    
  end

end