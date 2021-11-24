# frozen_string_literal: true

feature 'Adding a new bookmark' do
  scenario 'The user can add a bookmark to the web app' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.test.com')
    click_button('Submit')

    expect(page).to have_content 'http://www.test.com'
  end
end

