require 'rails_helper'

RSpec.describe Phase, type: :model do
  let(:phase) { build(:phase) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(phase).to validate_presence_of(:title)
    end

  end
end
