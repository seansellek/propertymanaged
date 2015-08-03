require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  context 'GET #new' do
    let(:ticket) { create :ticket }
    let(:propertytenant) { create :property_tenant}
    let(:tenant) { propertytenant.tenant}
  

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
    
    it 'Assigns @ticket to property tenant of logged in tenant' do
      login tenant
      get 'new'
      expect(ticket.property_tenant).to be propertytenant
    end

  end

end
