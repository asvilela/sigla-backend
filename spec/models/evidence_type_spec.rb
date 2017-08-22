require 'rails_helper'

RSpec.describe EvidenceType, type: :model do
  let(:evidence_type) { build(:evidence_type) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(evidence_type).to validate_presence_of(:title)
    end

  end
end
