require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  context 'When model is valid' do
    it 'validate_presence_of email' do
      expect(user).to validate_presence_of(:email)  
    end
    it 'validate_uniqueness_of email' do
      expect(user).to validate_uniqueness_of(:email).case_insensitive
    end
    it 'validate_confirmation_of password' do
      expect(user).to validate_confirmation_of(:password)  
    end
    it 'allow_value email' do
      expect(user).to allow_value('teste@teste.com.br').for(:email)
    end
  end

end
