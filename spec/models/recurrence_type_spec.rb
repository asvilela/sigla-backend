require 'rails_helper'

RSpec.describe RecurrenceType, type: :model do
  let(:recurrence_type) { build(:recurrence_type) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(recurrence_type).to validate_presence_of(:title)
    end

  end
end
