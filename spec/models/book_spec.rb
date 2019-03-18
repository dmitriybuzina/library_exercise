require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { FactoryBot.create(:book) }

  describe 'Be mongoid document' do
    it { is_expected.to be_mongoid_document }
  end

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

  describe 'Association' do
    it 'has many histories' do
      is_expected.to have_many :histories
    end

    it 'has many likes' do
      is_expected.to have_many :likes
    end

    it 'has many comments' do
      is_expected.to have_many :comments
    end
  end

  describe 'Dependent destroy' do
    it 'destroy histories when destroy book' do
      5.times { FactoryBot.create(:history, book_id: book.id) }
      expect { book.destroy }.to change { History.count }.by(-5)
    end

    it 'destroy likes when destroy book' do
      5.times { FactoryBot.create(:like, book_id: book.id) }
      expect { book.destroy }.to change { Like.count }.by(-5)
    end

    it 'destroy comments when destroy book' do
      5.times { FactoryBot.create(:comment, book_id: book.id) }
      expect { book.destroy }.to change { Comment.count }.by(-5)
    end
  end

  describe 'Methods' do
    let(:book_with_like) { FactoryBot.create(:book) }
    let(:like) { FactoryBot.create(:like, book_id: book_with_like.id) }
    let(:history_not_return) { FactoryBot.create(:history, return: nil, book_id: book.id) }
    let(:user) { FactoryBot.create(:user) }

    it 'is liked_by' do
      expect(book_with_like.liked_by?(like.user_id)).to eq(true)
    end

    it 'is not liked by' do
      expect(book.liked_by?(like.user_id)).to eq(false)
    end

    it 'is taken_by' do
      expect(book.taken_by?(history_not_return.user_id)).to eq(true)
    end

    it 'is not taken_by' do
      expect(book.taken_by?(user.id)).to eq(false)
    end

    context 'Search' do
      let(:book) { FactoryBot.create(:book, name: 'NameOfBook') }
      it 'find book' do
        book
        search_book = Book.search('NameOfBook')
        expect(book.name).to eq(search_book.name)
      end

      it 'not find book' do
        search_book = Book.search('AnotherName')
        expect(book.name).not_to eq(search_book.name)
      end
    end
  end
end
