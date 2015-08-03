require 'rails_helper'

RSpec.describe "Landlord Creation:" do
  context 'when visiting new landlord path' do
    before { visit new_landlord_path }
    it 'displays signup form' do
      page.should have_content 'Name'
      page.should have_content 'Email'
      page.should have_content 'Password'
      page.should have_content 'Confirm Password'
      page.has_field? 'name'
      page.has_field? 'email'
      page.has_field? 'password'
      page.has_field? 'password_confirmation'
      page.has_button? 'Sign Up'
    end
  end
  context 'when visiting signup path' do
    it 'displays the sign up form' do
      visit signup_path
      page.should have_content 'Name'
      page.should have_content 'Email'
      page.should have_content 'Password'
      page.should have_content 'Confirm Password'
      page.has_field? 'name'
      page.has_field? 'email'
      page.has_field? 'password'
      page.has_field? 'password_confirmation'
      page.has_button? 'Sign Up'
    end
  end
  context 'when submitting form' do
    before do
      visit new_landlord_path
      fill_in 'Email', with: 'xajler@gmail.com'
      fill_in 'Password', with: 'z1234567'
      fill_in 'Confirm Password', with: 'z1234567'
      fill_in 'Name', with: 'Kornelije Sajler'
    end
    it 'saves landlord' do
      click_button 'Sign Up'
      page.should have_content 'The Landlord is successfully saved!'
    end
    it 'sends to dashboard' do
      click_button 'Sign Up'
      current_path.should == dashboard_path
    end
    it 'alerts of password mismatch' do
      fill_in 'Confirm Password', with: 'x1234567'
      click_button 'Sign Up'

      page.should have_content "Password confirmation doesn't match"
    end
    it 'alerts of blank email' do
      fill_in 'Email', with: ''
      click_button 'Sign Up'

      page.should have_content "Email can't be blank"
    end
    it 'alerts of blank password' do
      fill_in 'Password', with: ''
      click_button 'Sign Up'

      page.should have_content "Password can't be blank"
    end
    it 'alerts of existing email' do
      create :landlord

      click_button 'Sign Up'

      page.should have_content "Email has already been taken"
    end
    it 'alerts of too short password' do
      fill_in 'Password', with: '123'
      fill_in 'Confirm Password', with: '123'
      click_button 'Sign Up'

      page.should have_content "Password is too short (minimum is 8 characters)"
    end
  end
  context 'when updating landlord' do
    it 'with valid landlord updates landlord' do
      landlord = create :landlord
      visit edit_landlord_path landlord

      find_field('Email').value.should be == 'xajler@gmail.com'
      find_field('Name').value.should be == 'Kornelije Sajler'

      fill_in 'Password', with: 'aoeuidht'
      fill_in 'Confirm Password', with: 'aoeuidht'
      fill_in 'Name', with: 'Kornelije Sajler - xajler'
      click_button 'Update Landlord'

      page.should have_content 'Landlord is successfully updated!'
    end
    it 'with invalid landlord alerts of mismatched password' do
      landlord = create :landlord
      visit edit_landlord_path landlord

      fill_in 'Password', with: 'aoeuidht'
      fill_in 'Confirm Password', with: 'aoeu'
      click_button 'Update Landlord'

      page.should have_content "Password confirmation doesn't match"
    end
  end
end



      
