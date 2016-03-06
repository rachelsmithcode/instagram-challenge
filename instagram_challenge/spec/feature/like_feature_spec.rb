require 'rails_helper'

feature 'like photos' do
  before do
    cat = Photo.create(name: 'cat')
  end

  it 'a user can like a picture, which updates the photos liked count', js: true do
    visit '/photos'
    click_link 'like photo'
    expect(page).to have_content('1 like')
  end


end
