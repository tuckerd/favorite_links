require 'spec_helper'

feature 'Creating Favorites' do
  before do
    visit '/'
    click_link 'New Favorite'
  end

  scenario 'can create a favorite' do
    fill_in 'URL', with: 'http://www.xkcd.com'
    fill_in 'Title', with: 'XKCD Comics'
    fill_in 'Notes', with: 'Nerdy, Fun Comics'
    click_button 'Create'
    page.should have_content 'Favorite has been created.'
  end

  scenario "can not create a favorite without a URL" do
    fill_in 'Title', with: 'XKCD Comics'
    fill_in 'Notes', with: 'Nerdy, Fun Comics'
    click_button 'Create'
    page.should have_content("Url can't be blank")
  end
end
