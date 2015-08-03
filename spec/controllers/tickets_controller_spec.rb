require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:ticket) { create :ticket }
  let(:propertytenant) { create :property_tenant}
  let(:tenant) { propertytenant.tenant}

  context 'GET #new' do
    it 'Instantiates a new ticket' do
      login tenant
      get 'new'
      expect(assigns[:ticket]).to be_a(Ticket)
    end

    it "Renders 'new' view" do
      login tenant
      get 'new'
      expect(response).to render_template(:new)
    end

    it "Doesn't allow landlord to create a ticket" do
      login propertytenant.property.landlord
      get 'new'

      expect(response).to redirect_to dashboard_path
    end
  end

  context 'POST #create' do
    it 'Assigns @ticket to property tenant of logged in tenant' do
      login tenant
      post 'create', ticket: attributes_for(:ticket)
      expect(assigns(:ticket).property_tenant).to eq(propertytenant)
    end
    it 'Saves ticket to database' do
      login tenant
      post 'create', ticket: attributes_for(:ticket)
      expect(assigns(:ticket).persisted?).to be_truthy
    end
    it "Redirects user to dashboard" do
      login tenant
      post 'create', ticket: attributes_for(:ticket)
      expect(response).to redirect_to dashboard_path
    end
  end

  context 'GET #edit' do
    before(:each) do
      get 'edit', id: ticket.id
    end
    it 'retrieves ticket from db and instantiates it as @ticket' do
      expect(assigns(:ticket)).to eq(ticket)
    end
    it "renders 'edit' view" do
      expect(response).to render_template 'edit'
    end
  end



end
