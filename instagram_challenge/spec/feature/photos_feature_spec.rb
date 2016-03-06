require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add photos' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(name: 'Image thing')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('Image thing')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'creating photos' do
    scenario 'prompts user to fill out a form, then displays the new photo' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Name', with: 'Image thing'
      click_button 'Create Photo'
      expect(page).to have_content 'Image thing'
      expect(current_path).to eq '/photos'
    end
  end


  context 'viewing photo details' do
    let!(:image_thing){Photo.create(name:'Image thing')}

    scenario 'lets a user view a photo' do
     visit '/photos'
     click_link 'Image thing'
     expect(page).to have_content 'Image thing'
     expect(current_path).to eq "/photos/#{image_thing.id}"
    end
  end

  context 'editing photos' do
    before { Photo.create name: 'Image thing' }

    scenario 'let a user edit a photo' do
     visit '/photos'
     click_link 'Edit Image thing'
     fill_in 'Name', with: 'New image thing'
     click_button 'Update Photo'
     expect(page).to have_content 'New image thing'
     expect(current_path).to eq '/photos'
    end
  end

  context 'deleting photos' do

    before {Photo.create name: 'Image thing'}

    scenario 'removes a photo when a user clicks a delete link' do
      visit '/photos'
      click_link 'Delete Image thing'
      expect(page).not_to have_content 'Image thing'
      expect(page).to have_content 'Photo deleted successfully'
    end
  end

end
