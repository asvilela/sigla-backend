require 'rails_helper'

RSpec.describe Folder, type: :model do
  let(:folder) { build(:folder) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(folder).to validate_presence_of(:title)
    end

    it 'must has the description property' do
      expect(folder).to validate_presence_of(:description)
    end

    it 'must has the enterprise property' do
      expect(folder).to validate_presence_of(:enterprise)
    end

    it 'must has the feature property' do
      expect(folder).to validate_presence_of(:feature)
    end

    it 'must has the phase property' do
      expect(folder).to validate_presence_of(:phase)
    end

  end
end
