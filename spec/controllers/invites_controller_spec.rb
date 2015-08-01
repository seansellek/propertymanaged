require 'rails_helper'

RSpec.describe InvitesController, type: :controller, invite_system: true do
  let(:landlord) { create :landlord }
  let(:property) { create :property }
  
  before do
    property.landlord = landlord
    property.save
    login(landlord)
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
    before { post :create, invite: {property_id: property.id.to_s, email: 'me@seansellek.com'} }
    it 'instantiates new invite' do
      expect(assigns(:invite)).to be_a(Invite)
    end
    it 'Associates invite with current user' do
      expect(assigns(:invite).landlord).to be == landlord
    end
    it 'Makes call to InviteMailer on successful save'
  end
end
