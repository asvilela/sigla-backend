require 'rails_helper'

RSpec.describe ConditionalType, type: :model do
  let(:conditional_type) { build(:conditional_type) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(conditional_type).to validate_presence_of(:title)
    end

  end
end
