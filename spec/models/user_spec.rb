require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'Be mongoid document' do
    it { is_expected.to be_mongoid_document }
  end

  describe 'Validation' do
    it 'is not valid without email' do
      expect(FactoryBot.build :user, email: nil).not_to be_valid
    end

    it 'is not valid without password' do
      expect(FactoryBot.build :user, password: nil).not_to be_valid
    end

    it 'is not valid without username' do
      expect(FactoryBot.build :user, username: nil).not_to be_valid
    end
  end

  describe 'Association' do
    it 'has many comments' do
      is_expected.to have_many :comments
    end

    it 'has many histories' do
      is_expected.to have_many :histories
    end

    it 'has many likes' do
      is_expected.to have_many :likes
    end
  end
end