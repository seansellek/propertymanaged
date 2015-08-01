require 'rails_helper'

RSpec.describe "Invite feature tests", invite_system: true do

  context 'Create New Invite' do
    let(:property) { create :property}
    before { visit "properties/#{property.id}/invite/new" }
    it 'should route ok' do
    end
    it 'should display new invite form' do
      page.should have_content 'Email'
      page.has_field? 'email'
      page.has_button? 'Invite Tenant'
    end
    it 'should create invite' do

    end
  end



end
