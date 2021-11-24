# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.create(url: 'http://www.makersacademy.com')
      Bookmark.create(url: 'http://www.destroyallsoftware.com')
      Bookmark.create(url: 'http://www.google.com')

      bookmark = Bookmark.all

      expect(bookmark).to include('http://www.makersacademy.com')
      expect(bookmark).to include('http://www.destroyallsoftware.com')
      expect(bookmark).to include('http://www.google.com')
    end
  end
end

describe '.create' do
  it 'creates a new bookmark' do
    Bookmark.create(url: 'http://www.test.com')

    expect(Bookmark.all).to include('http://www.test.com')
  end
end
