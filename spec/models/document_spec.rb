require 'rails_helper'

RSpec.describe Document, type: :model do
  let(:document) { build(:document) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(document).to validate_presence_of(:title)
    end

    it 'must has the description property' do
      expect(document).to validate_presence_of(:description)
    end

    it 'must has the file_path property' do
      expect(document).to validate_presence_of(:file_path)
    end

    it 'must has the issue_date property' do
      expect(document).to validate_presence_of(:issue_date)
    end
    
    it 'must has the folder property' do
      expect(document).to validate_presence_of(:folder)
    end
    
    it 'must has the content_type property' do
      expect(document).to validate_presence_of(:content_type)
    end

  end
end
