# frozen_string_literal: true

feature 'delete a bookmark' do
  scenario 'user deletes a bookmark' do
    Bookmark.create(url: 'http//www.test.com', title: 'Test')
    visit('/bookmarks')
    expect(page).to have_link('Test', href: 'http//www.test.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Test', href: 'http//www.test.com')
  end
end
