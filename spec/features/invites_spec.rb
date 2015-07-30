require 'rails_helper'

RSpec.describe "Invite feature tests", invite_system: true do

  context 'GET /property/:id/invite/new' do
    let(:property) { create :property}

    before { visit new_property_invite_path(property) }

    it 'should route ok' do
    end

    it 'should display new invite form' do
      page.should have_content 'Email'
      page.has_field? 'email'
      page.has_button? 'Invite Tenant'
    end

  end


end
