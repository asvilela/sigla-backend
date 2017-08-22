require 'rails_helper'

RSpec.describe TaskStatus, type: :model do
  let(:task_status) { build(:task_status) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(task_status).to validate_presence_of(:title)
    end

  end
end
