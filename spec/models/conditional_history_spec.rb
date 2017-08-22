require 'rails_helper'

RSpec.describe ConditionalHistory, type: :model do
  let(:conditional_history) { build(:conditional_history) }

  context 'When model is valid' do

    it 'must has the conditional property' do
      expect(conditional_history).to validate_presence_of(:conditional)
    end

    it 'must has the conditional_status property' do
      expect(conditional_history).to validate_presence_of(:conditional_status)
    end

    it 'must has the user property' do
      expect(conditional_history).to validate_presence_of(:user)
    end

  end
end
