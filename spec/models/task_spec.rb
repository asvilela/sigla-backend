require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { build(:task) }

  context 'When model is valid' do

    it 'must has the title property' do
      expect(task).to validate_presence_of(:title)
    end

    it 'must has the description property' do
      expect(task).to validate_presence_of(:description)
    end

    it 'must has the start_date property' do
      expect(task).to validate_presence_of(:start_date)
    end

    it 'must has the conditional property' do
      expect(task).to validate_presence_of(:conditional)
    end

    it 'must has the priority property' do
      expect(task).to validate_presence_of(:priority)
    end

    it 'must has the task_status property' do
      expect(task).to validate_presence_of(:task_status)
    end

  end
end
