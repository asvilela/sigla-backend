require 'rails_helper'

RSpec.describe ConditionalStatus, type: :model do
  let(:conditional_status) { build(:conditional_status) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(conditional_status).to validate_presence_of(:title)
    end

  end
end
