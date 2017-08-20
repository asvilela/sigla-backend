require 'rails_helper'

RSpec.describe ContentType, type: :model do
  let(:content_type) { build(:content_type) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(content_type).to validate_presence_of(:title)
    end

  end
end
