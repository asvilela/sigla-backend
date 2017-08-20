require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { build(:address) }

  context 'When model is valid' do

    it 'must has the zipCode property' do
      expect(address).to validate_presence_of(:zipCode)
    end

    it 'must has the street property' do
      expect(address).to validate_presence_of(:street)
    end

    it 'must has the number property' do
      expect(address).to validate_presence_of(:number)
    end

    it 'must has the neighborhood property' do
      expect(address).to validate_presence_of(:neighborhood)
    end

    it 'must has the city property' do
      expect(address).to validate_presence_of(:city)
    end

    it 'must has the state property' do
      expect(address).to validate_presence_of(:state)
    end

    it 'must has the country property' do
      expect(address).to validate_presence_of(:country)
    end

  end
end
