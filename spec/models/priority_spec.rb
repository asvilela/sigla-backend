require 'rails_helper'

RSpec.describe Priority, type: :model do
  let(:priority) { build(:priority) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(priority).to validate_presence_of(:title)
    end

  end
end
