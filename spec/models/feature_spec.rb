require 'rails_helper'

RSpec.describe Feature, type: :model do
  let(:feature) { build(:feature) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(feature).to validate_presence_of(:title)
    end

  end
end
