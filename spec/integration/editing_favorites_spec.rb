require 'spec_helper'

feature 'Editing Favorites' do
  before do
    Factory(:favorite)
    visit '/'
    click_link 'XKCD Comics' 
    #should then take you to index
    click_link 'Edit'
  end

  scenario 'can edit/update a favorite' do
    fill_in 'Notes', with: 'Math, Science, Coding Comics'
    click_button 'Update Favorite'
    page.should have_content 'Favorite was successfully updated.'
  end
end
