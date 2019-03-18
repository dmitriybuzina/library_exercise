require 'rails_helper'

RSpec.describe History, type: :model do
  let(:history) { FactoryBot.create(:history) }

  describe 'Be mongoid document' do
    it { is_expected.to be_mongoid_document }
  end

  describe 'Validation' do
    it 'is not valid without take' do
      expect(FactoryBot.build :history, take: nil).not_to be_valid
    end

    it 'is valid without return' do
      expect(FactoryBot.build :history, return: nil).to be_valid
    end
  end

  describe 'Association' do
    it 'belongs to user' do
      is_expected.to belong_to :user
    end

    it 'belongs to book' do
      is_expected.to belong_to :book
    end
  end
end