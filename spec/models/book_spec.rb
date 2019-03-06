require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book){ FactoryBot.create(:book) }
  describe 'Validation' do
    it 'is valid without publich' do
      expect(FactoryBot.build :book, publishing_house: nil ).to be_valid
    end
  end
end
