require 'rails_helper'

RSpec.describe Api::V1::ApplicationController, type: :controller do
  
  describe 'Returns Authenticable concerns' do
    it 'Is true' do
      expect(controller.class.ancestors).to include(Authenticable)
    end
  end

end