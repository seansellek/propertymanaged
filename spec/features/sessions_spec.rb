
require 'rails_helper'

RSpec.describe "Session Feature Tests" do
  context 'GET /login' do
    it 'display login form' do
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

end
