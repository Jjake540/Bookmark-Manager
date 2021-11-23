# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmark = Bookmark.all

      expect(bookmark).to include('http://www.makersacademy.com')
      expect(bookmark).to include('http://www.google.com')
    end
  end
end
