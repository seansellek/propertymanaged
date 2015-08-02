require 'rails_helper'

RSpec.describe "Properties CRUD:" do
  context 'When viewing dashboard' do
    let(:landlord) { create :landlord}
    before do
      page.set_rack_session(user_id: landlord.id)
      page.set_rack_session(user_type: 'landlord')
      visit dashboard_path
    end

    it 'displays create propety link' do
      expect(page).to have_content('Create Property')
    end

    it 'and clicking Create Property link, takes you to properties#new' do
      click_link('Create Property')
      expect(page).to have_content('New Property')
    end

    it 'and clicking link, displays form' do
      click_link('Create Property')

      #build this test further after making first two tests pass.
      expect(page).to have_field('Name:')
      expect(page).to have_field('Address 1:')
      expect(page).to have_field('Address 2:')
      expect(page).to have_field('City:')
      expect(page).to have_field('State:')
      expect(page).to have_field('Zip:')
    end

    context 'when submitting property form' do
      before do
        visit new_property_path
        fill_in 'Name:', with: 'Angelica Rodriguez'
        fill_in 'Address 1:', with: 'Main Street'
        fill_in 'Address 2:', with: '#305'
        fill_in 'City:', with: 'Miami'
        fill_in 'State:', with: 'FL'
        fill_in 'Zip:', with: '33025'

      end

      it 'saves property' do
         click_button('Create Property')
         page.should have_content "The Property is successfully saved!"
      end

      it 'redirects to dashboard' do
        click_button('Create Property')
        current_path.should == dashboard_path
      end


    it 'displays show property link' do
      click_button('Create Property')
      expect(page).to have_link('Show Property')
    end

    it 'and clicking Show Property link, takes you to properties#show' do
      click_button('Create Property')
      click_link('Show Property')
      expect(page).to have_content('Show Property')
    end


    it 'and clicking link, displays form' do
      click_button('Create Property')
      click_link('Show Property')

      #build this test further after making first two tests pass.
      expect(page).to have_content('Name:')
      expect(page).to have_content('Address 1:')
      expect(page).to have_content('Address 2:')
      expect(page).to have_content('City:')
      expect(page).to have_content('State:')
      expect(page).to have_content('Zip:')
    end

    it 'displays edit property link' do
      click_button('Create Property')
      visit dashboard_path
      expect(page).to have_link('Edit Property')
    end

    it 'and clicking edit Property link, takes you to properties#edit' do
      click_button 'Create Property'
      visit dashboard_path
      expect(page).to have_content('Edit Property')
      click_link('Edit Property')
      expect(page).to have_content('Edit Property')
      current_path.should match(/properties\/.+\/edit/)
    end


    it 'and clicking link, displays form' do
      click_button('Create Property')
      visit dashboard_path
      click_link('Edit Property')

      #build this test further after making first two tests pass.
      expect(page).to have_field('Name:')
      expect(page).to have_field('Address 1:')
      expect(page).to have_field('Address 2:')
      expect(page).to have_field('City:')
      expect(page).to have_field('State:')
      expect(page).to have_field('Zip:')


    end

    it 'displays delete property link' do
      click_button('Create Property')
      visit dashboard_path
      expect(page).to have_link('Delete Property')
    end

    it 'deletes the property' do
      click_button('Create Property')
      visit dashboard_path
      click_link 'Delete Property'
      page.should have_content 'Property was successfully destroyed.'
    end


    end




  end




  end
