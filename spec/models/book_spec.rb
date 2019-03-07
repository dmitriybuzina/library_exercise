require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book){ FactoryBot.create(:book) }
  describe 'Validation' do
    it 'is valid without author' do
      expect(FactoryBot.build :book, author: nil ).to be_valid
    end

    it 'is valid without description' do
      expect(FactoryBot.build :book, description: nil ).to be_valid
    end

    it 'is valid without publiching house' do
      expect(FactoryBot.build :book, publishing_house: nil ).to be_valid
    end

    it 'is valid without year' do
      expect(FactoryBot.build :book, year: nil ).to be_valid
    end

    it 'is valid without image' do
      expect(FactoryBot.build :book, image: nil ).to be_valid
    end

    it 'is not valid without name' do
      expect(FactoryBot.build :book, name: nil ).not_to be_valid
    end
  end
  
end
