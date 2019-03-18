require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { FactoryBot.create(:like) }

  describe 'Be mongoid document' do
    it { is_expected.to be_mongoid_document }
  end

  describe 'Validation' do
    it 'is not valid without count of stars' do
      expect(FactoryBot.build :like, count_of_stars: nil).not_to be_valid
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