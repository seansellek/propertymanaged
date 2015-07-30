require 'rails_helper'

RSpec.describe "Invite feature tests" do

  context 'GET /property/:id/invite/new' do
    let(:property) { create :property}

    before { visit new_property_invite_path(property) }

    it 'should visit new invite form' do
    end

    it 'should display new invite form' do
      page.find("#property_id", :visible => false).value.should be == property.id
      page.should have_content 'Email'
      page.has_field? 'email'
      page.has_button? 'Invite tenant'
    end

  end


end
