require 'rails_helper'

RSpec.describe TaskHistory, type: :model do
  let(:task_history) { build(:task_history) }

  context 'When model is valid' do

    it 'must has the task property' do
      expect(task_history).to validate_presence_of(:task)
    end

    it 'must has the task_status property' do
      expect(task_history).to validate_presence_of(:task_status)
    end

    it 'must has the user property' do
      expect(task_history).to validate_presence_of(:user)
    end

  end
end
