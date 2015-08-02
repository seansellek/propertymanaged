require 'rails_helper'

RSpec.describe "Tenant Registration:", tenants: true do
  let(:invite) {create :invite}
  context 'Tenant clicks registration link' do
    it 'shows form' do
      visit "/tenants/signup?invite_token=#{invite.token}"
      token = find('#tenant_token', visible: false).value
      expect(token).to be == invite.token
    end
  end
end
