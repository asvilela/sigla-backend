require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { build(:company) }

  context 'When model is valid' do

    it 'must has the cnpj property' do
      expect(company).to validate_presence_of(:cnpj)
    end
    it 'must has the company_name property' do
      expect(company).to validate_presence_of(:company_name)
    end
    it 'must has the trade_name property' do
      expect(company).to validate_presence_of(:trade_name)
    end

    it 'must has the company_type property' do
      expect(company).to validate_presence_of(:company_type)
    end
  end
end
