require 'rails_helper'

RSpec.describe Authenticable do

  ######################################################################################### 
  # Creaate anonimous controller and include concerns
  #########################################################################################
  controller(ApplicationController) do
    include Authenticable  
  end

  let(:app_controller) { subject }

  ######################################################################################### 
  # Test of authenticate
  #########################################################################################
  describe '#current_user' do
    let(:user) { create(:user) }

    before do
      # Mock Authorization token
      req = double(:headers => { 'Authorization' => user.authentication_token })
      allow(app_controller).to receive(:request).and_return(req)
    end

    it 'User logged in' do
      expect(app_controller.current_user).to eq(user)
    end
  end

  ######################################################################################### 
  # Test of authenticate (current_user = nil)
  #########################################################################################
  describe '#authenticate_with_token!' do
    controller do
      before_action :authenticate_with_token!

      def restricted_action
      end
    end

    context 'User logged out' do
      before do
        # Mock current_user = nil
        allow(app_controller).to receive(:current_user).and_return(nil)
        # Create nonymous routes
        routes.draw { get 'restricted_action' => 'anonymous#restricted_action' }
        get :restricted_action
      end

      it 'Returns status code Unauthorized' do
        expect(response).to have_http_status(401)
      end      

      it 'Returns errors' do
        expect(json_body).to have_key(:errors)
      end
    end
    
  end

  ######################################################################################### 
  # Test method user_logged_in?
  #########################################################################################
  describe '#user_logged_in?' do
    
    context 'User logged in' do
      before do
        # Mock current_user
        user = create(:user)
        allow(app_controller).to receive(:current_user).and_return(user)
      end

      it { expect(app_controller.user_logged_in?).to be true }
    end

    context 'User logged out' do
      before do
        # Mock current_user = nil
        allow(app_controller).to receive(:current_user).and_return(nil)
      end
      it { expect(app_controller.user_logged_in?).to be false }
    end
  end

end