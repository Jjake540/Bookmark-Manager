# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

# Main class
class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end

  run! if app_file == $0
  # app.rb:13:23: C: [Correctable] Style/SpecialGlobalVars: Prefer $PROGRAM_NAME over $0.
end
