require 'rails_helper'

RSpec.describe CompanyType, type: :model do
  let(:company_type) { build(:company_type) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(company_type).to validate_presence_of(:title)
    end

  end
end
