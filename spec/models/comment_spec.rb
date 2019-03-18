require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { FactoryBot.create(:comment) }

  describe 'Be mongoid document' do
    it { is_expected.to be_mongoid_document }
  end

  describe 'Have timestamps' do
    it { is_expected.to have_timestamps }
  end

  describe 'Validation' do
    it 'is not valid without body' do
      expect(FactoryBot.build :comment, body: nil).not_to be_valid
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