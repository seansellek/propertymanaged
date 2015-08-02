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
    it "renders 'noinvite' when invalid token" do
      get :new, invite_token: '94a8e81841adaedd060968109a16c48c575a37dc'
      expect(response).to render_template(:noinvite)
    end
  end

  describe 'POST #create' do
    it 'Assigns token' do
      get :create, invite_token: invite.token, tenant: attributes_for(:tenant)
      expect(assigns[:token]).to be == invite.token
    end
    it 'Assigns invite' do
      get :create, invite_token: invite.token, tenant: attributes_for(:tenant)
      expect(assigns[:invite]).to be == invite
    end
    it "renders 'noinvite' when invite not found" do
      get :create, invite_token: '94a8e81841adaedd060968109a16c48c575a37dc',
        tenant: attributes_for(:tenant)
      expect(response).to render_template :noinvite
    end
    it "creates a PropertyTenant" do
      get :create, invite_token: invite.token, tenant: attributes_for(:tenant)
      expect(assigns[:propertytenant]).to be_a(PropertyTenant)
      expect(assigns(:propertytenant).property).to be == invite.property
    end
    it 'destroys invite upon success' do
      get :create, invite_token: invite.token, tenant: attributes_for(:tenant)
      expect(Invite.find_by(id: invite.id)).to be_nil
    end

  end
end
