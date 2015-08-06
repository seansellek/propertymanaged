require 'rails_helper'

RSpec.describe "Tenant Registration:", tenants: true do
  let(:invite) {create :invite}
  context 'Tenant clicks registration link' do
    it 'shows form' do
      visit "/tenants/signup?invite_token=#{invite.token}"
      token = find('#tenant_token', visible: false).value
      expect(token).to be == invite.token
    end
    it 'sends to dashboard' do
      visit "/tenants/signup?invite_token=#{invite.token}"
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Name', with: 'Sean'
      fill_in 'Password', with: 'asdfghjk'
      fill_in 'Password confirmation', with: 'asdfghjk'
      click_button('Create Tenant')

      expect(current_path).to be == dashboard_path
    end
  end
end
