require 'rails_helper'

RSpec.describe InvitesController, type: :controller, invite_system: true do
  let(:property) { create :property }
    let(:landlord) { property.landlord }
  
  before do
    login(landlord)
    mail = double(deliver_now: true)
    allow(InviteMailer).to receive(:new_tenant_invite).and_return(mail)
    allow(InviteMailer).to receive(:existing_tenant_invite).and_return(mail)
  end
  describe 'GET #new' do
    before { get :new, property_id: property.id.to_s }
    it 'Instantiates new invite' do
      expect(assigns(:invite)).to be_a_new(Invite)
    end
    it 'Associates invite with property' do
      expect(assigns(:invite).property_id).to be == property.id
    end
    it 'Renders the new invite template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
  #   before { post :create, invite: {property_id: property.id.to_s, email: 'me@seansellek.com', amount: '$5,000.00'} }
  #   it 'instantiates new invite' do
  #     expect(assigns(:invite)).to be_a(Invite)
  #   end
  #   it 'Associates invite with current user' do
  #     expect(assigns(:invite).landlord).to be == landlord
  #   end
  #   it 'Saves amount' do
  #     expect(assigns(:invite).amount).to be == 500000
  #   end
  end
  describe 'POST #create' do
    # it 'Makes call to InviteMailer on successful save' do
    #   expect(InviteMailer).to receive(:new_tenant_invite)
    #   post :create, invite: {property_id: property.id.to_s, email: 'me@seansellek.com'}
    # end
    it "Handles existing tenants by adding them to a new PropertyTenant" do
      tenant = create :tenant
      expect(InviteMailer).to receive(:existing_tenant_invite)
      post :create, invite: {property_id: property.id, email: tenant.email, amount: '$5000.00'}
      expect(tenant.property_tenants.empty?).to_not be_truthy
      expect(tenant.property_tenants.first.rate).to be == 500000 

    end
  end
end
