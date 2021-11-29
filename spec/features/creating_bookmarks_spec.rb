# frozen_string_literal: true

feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')

    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end

  scenario 'The bookmark mush be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'fake bookmark')
    click_button('Submit')

    expect(page).not_to have_content 'Not a real bookmark'
    expect(page).to have_content 'Submit a valid URL'
  end
end
