require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:ticket) { create :ticket }
  let(:propertytenant) { ticket.property_tenant }
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
      login tenant
      # get 'edit', id: ticket.id
    end
    # it 'retrieves ticket from db and instantiates it as @ticket' do
    #   expect(assigns(:ticket)).to eq(ticket)
    # end
    # it "renders 'edit' view" do
    #   expect(response).to render_template :edit
    # end
    it 'only allows owner of ticket to edit' do
      ticket2 = create :ticket
      get 'edit', id: ticket2.id
      expect(flash[:error]).to_not be_nil
      expect(response).to redirect_to dashboard_path
    end
  end

  context 'PUT #update' do
    before do
      login tenant
    end
    it 'retrieves ticket from db and instantiates it as @ticket' do
       put 'update', id: ticket.id, ticket: attributes_for(:ticket, description: 'Hello')
       expect(assigns(:ticket)).to be_a(Ticket)
       expect(assigns(:ticket).id).to eq ticket.id

    end 
    it 'redirects to Dashboard' do
      put 'update', id: ticket.id, ticket: attributes_for(:ticket, description: 'Hello')
      expect(response).to redirect_to dashboard_path
    end
    it 'updates ticket successfully' do
       put 'update', id: ticket.id, ticket: attributes_for(:ticket, description: 'Hello')
      expect(assigns(:ticket)).to be_a(Ticket)
      expect(assigns(:ticket).description).to eq('Hello')
    end

    it 'does not allow landlord'

    it 'only allows owner of ticket' do
      ticket2 = create :ticket
      get 'update', id: ticket2.id
      expect(flash[:error]).to_not be_nil
      expect(response).to redirect_to dashboard_path
    end
    # it 'does not allow you to change the title' do
    #   put 'update', id: ticket.id, ticket: attributes_for(:ticket, title: 'Hello')
    #   expect(assigns(:ticket).errors.full_messages.empty?).to_not  be_truthy
    # end
  end

  context 'GET #close' do
    before do
      login tenant
    end
    it 'allows either landlord or tenant' 

    it 'only allows owner of ticket' do
      ticket2 = create :ticket
      get 'close', id: ticket2.id
      expect(flash[:error]).to_not be_nil
      expect(response).to redirect_to dashboard_path
    end



  end



end
