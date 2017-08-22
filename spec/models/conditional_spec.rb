require 'rails_helper'

RSpec.describe Conditional, type: :model do
  let(:conditional) { build(:conditional) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(conditional).to validate_presence_of(:title)
    end

    it 'must has the description property' do
      expect(conditional).to validate_presence_of(:description)
    end

    it 'must has the due_date property' do
      expect(conditional).to validate_presence_of(:due_date)
    end

    it 'must has the document property' do
      expect(conditional).to validate_presence_of(:document)
    end

    it 'must has the conditional_status property' do
      expect(conditional).to validate_presence_of(:conditional_status)
    end

    it 'must has the conditional_type property' do
      expect(conditional).to validate_presence_of(:conditional_type)
    end

    it 'must has the recurrence_type property' do
      expect(conditional).to validate_presence_of(:recurrence_type)
    end

  end
end
