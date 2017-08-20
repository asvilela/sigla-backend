require 'rails_helper'

RSpec.describe Enterprise, type: :model do
  let(:enterprise) { build(:enterprise) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(enterprise).to validate_presence_of(:title)
    end

    it 'must has the description property' do
      expect(enterprise).to validate_presence_of(:description)
    end

    it 'must has the enterprise_type property' do
      expect(enterprise).to validate_presence_of(:enterprise_type)
    end

  end
end
