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
    before do
      visit new_landlord_path
      fill_in 'Email', with: 'xajler@gmail.com'
      fill_in 'Password', with: 'z1234567'
      fill_in 'Confirm Password', with: 'z1234567'
      fill_in 'Name', with: 'Kornelije Sajler'
    end
    context'saves valid landlord' do
      it 'saves valid landlord' do
        click_button 'Sign Up'
        page.should have_content 'The Landlord is successfully saved!'
      end
      it 'redirects to signin path' do
        click_button 'Sign Up'
        current_path.should == login_path
      end
    end
    context "doesn't save invalid landlord" do
      it 'when passwords mismatch' do
        fill_in 'Confirm Password', with: 'x1234567'
        click_button 'Sign Up'

        page.should have_content "Password confirmation doesn't match"
      end
      it 'when email is blank' do
        fill_in 'Email', with: ''
        click_button 'Sign Up'

        page.should have_content "Email can't be blank"
      end
      it 'when password is blank' do
        fill_in 'Password', with: ''
        click_button 'Sign Up'

        page.should have_content "Password can't be blank"
      end
      it 'when email is not unique' do
        create :landlord

        click_button 'Sign Up'

        page.should have_content "Email has already been taken"
      end
      it 'when password is less than 8 characters' do
        fill_in 'Password', with: '123'
        fill_in 'Confirm Password', with: '123'
        click_button 'Sign Up'

        page.should have_content "Password is too short (minimum is 8 characters)"
      end
    end
  end
  context 'PUT landlords/id' do
    it 'valid landlord update' do
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
    it 'invalid when passwords mismatch' do
      landlord = create :landlord
      visit edit_landlord_path landlord

      fill_in 'Password', with: 'aoeuidht'
      fill_in 'Confirm Password', with: 'aoeu'
      click_button 'Update Landlord'

      page.should have_content "Password confirmation doesn't match"
    end
  end
end



      
