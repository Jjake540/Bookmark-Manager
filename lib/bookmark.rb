# frozen_string_literal: true

require 'pg'

# Bookmark main class
class Bookmark
  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end
end
