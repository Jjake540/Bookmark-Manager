# frozen_string_literal: true

require 'bookmark'
require 'database_helpers'

  describe '.all' do
    it 'returns a list of bookmarks' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id, table: 'bookmarks')

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end

    it 'does not create a invalid bookmark' do
      Bookmark.create(url: 'www.fakebookmark.com', title: 'fake bookmark')

      expect(Bookmark.all).to be_empty
    end
  end

  describe '.delete' do
    it 'deletes the selected bookmark' do
      bookmark = Bookmark.create(title: 'Google', url: 'http://www.google.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the selected bookmark' do
      bookmark = Bookmark.create(title: 'BBC', url: 'http://www.bbc.co.uk')
      updated_bookmark = Bookmark.update(id: bookmark.id, title: 'Test', url: 'http://www.example.com')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Test'
      expect(updated_bookmark.url).to eq 'http://www.example.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'BBC', url: 'http://www.bbc.co.uk')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'BBC'
      expect(result.url).to eq 'http://www.bbc.co.uk'
    end
  end

  describe '#comments' do
    let(:comment_class) { double(:comment_class) }
    
    it 'calls .where on the Comment class' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)

      bookmark.comments(comment_class)
    end
  end
