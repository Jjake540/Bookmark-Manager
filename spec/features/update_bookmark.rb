# frozen_string_literal: true

feature 'Update bookmark' do
  scenario 'User can update a bookmark' do
    bookmark = Bookmark.create(url: 'http://www.bbc.co.uk', title: 'BBC')
    visit('/bookmarks')
    expect(page).to have_link('BBC', href: 'http://www.bbc.co.uk')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: 'http://www.example.com')
    fill_in('title', with: 'Example')
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('BBC', href: 'http://www.bbc.co.uk')
    expect(page).to have_link('Example', href: 'http://www.example.com')
  end
end
