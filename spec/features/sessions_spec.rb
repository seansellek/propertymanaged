
require 'rails_helper'

RSpec.describe "Logging In:" do
  context 'when visiting login path' do
    it 'displays login form' do
      visit login_path
      page.should have_content 'Email'
      page.should have_content 'Password'
      page.should have_content 'Landlord'
      page.should have_content 'Tenant'
      page.has_field? 'email'
      page.has_field? 'password'
      page.has_field? 'user_type', type: 'radio', with: 'landlord'
      page.has_field? 'user_type', type: 'radio', with: 'tenant'
      page.has_button? 'Log in'
    end
  end
  context 'when logging in' do
    before do
      let(:landlord) { create :landlord }
      visit login_path

      fill_in 'email', with: 'xajler@gmail.com'
      fill_in 'password', with: 'x1234567'
    end
    it 'redirects you to dashboard' do
      click_button 'Log in'

      expect(current_path).to be == dashboard_path
    end
    it 'alerts you of incorrect credentials' do
      fill_in 'password', with: 'x1234980'
      click_button 'Log in'

      expect(flash[:error]).to be_present
    end
  end

end
