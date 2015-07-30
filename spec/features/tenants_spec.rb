require 'rails_helper'

RSpec.describe "Tenants" do
  context 'GET tenants/new' do
    it 'displays the create landlord page' do
      visit new_tenant_path

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
end
