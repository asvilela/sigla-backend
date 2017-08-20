require 'rails_helper'

RSpec.describe EnterpriseType, type: :model do
  let(:enterprise_type) { build(:enterprise_type) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(enterprise_type).to validate_presence_of(:title)
    end

  end
end
