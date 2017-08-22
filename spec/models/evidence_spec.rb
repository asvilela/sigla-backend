require 'rails_helper'

RSpec.describe Evidence, type: :model do
  let(:evidence) { build(:evidence) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(evidence).to validate_presence_of(:title)
    end

    it 'must has the task property' do
      expect(evidence).to validate_presence_of(:task)
    end

    it 'must has the evidence_type property' do
      expect(evidence).to validate_presence_of(:evidence_type)
    end

  end
end
