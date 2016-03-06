require 'rails_helper'

feature 'commenting' do
  before {Photo.create name: 'Image thing'}

  scenario 'allows users to leave a comment on a photo using a form' do
     visit '/photos'
     click_link 'Comment on Image thing'
     fill_in "Thoughts", with: "That's certianly an image thing"
     click_button 'Leave Comment'

     expect(current_path).to eq '/photos'
     expect(page).to have_content("That's certianly an image thing")
  end

end
