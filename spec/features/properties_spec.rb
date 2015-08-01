require 'rails_helper'

RSpec.describe "Properties CRUD:" do
  context 'When viewing dashboard' do
    before do
      login_landlord
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
      page.has_field? 'name'
      page.has_field? 'address1'


    end

  end

end
