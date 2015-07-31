require 'rails_helper'

RSpec.describe "Landlord Feature Tests" do

  context 'GET landlords/new' do
    before { visit new_landlord_path }
    it 'displays the create landlord page' do

    end

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

  context 'Get /signup' do
    it 'displays the sign up page' do
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

  context 'POST /landlord' do
    it 'creates and saves the valid landlord' do
      visit new_landlord_path

      fill_in 'Email', with: 'xajler@gmail.com'
      fill_in 'Password', with: 'x1234567'
      fill_in 'Confirm Password', with: 'x1234567'
      fill_in 'Name', with: 'Kornelije Sajler'
      click_button 'Sign Up'

      current_path.should be == signup_path
      page.should have_content 'The Landlord is successfully saved!'
    end
  end
end



      
