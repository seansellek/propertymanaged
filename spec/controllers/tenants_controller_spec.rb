require 'rails_helper'

RSpec.describe TenantsController, type: :controller, invite_system: true, tenants: true do
  let(:invite) { create :invite}

  describe 'GET #new' do 
    it 'Assigns token' do
      get :new, invite_token: invite.token
      expect(assigns[:token]).to be == invite.token
    end
    it "renders 'noinvite' when no token provided" do
      get :new
      expect(response).to render_template(:noinvite)
    end

  end
end
