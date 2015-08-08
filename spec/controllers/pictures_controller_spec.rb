require 'rails_helper'

RSpec.describe PicturesController, type: :controller do
  let(:picture) { create :picture }
  let(:ticket) { create :ticket }
  let(:propertytenant) { ticket.property_tenant }
  let(:tenant) { propertytenant.tenant}

  
  context 'GET #new' do
    it 'Instantiates a new picture' do
      login tenant
      get 'new'
      expect(assigns[:picture]).to be_a(Picture)
    end


    it "Renders 'new' view" do
      login tenant
      get 'new'
      expect(response).to render_template(:new)
    end
  end

 context 'POST #create' do

    it 'Assigns @picture to ticket' do
      login tenant
      post 'create', picture: attributes_for(:picture), ticket_id: ticket.id
      expect(assigns(:picture).ticket).to eq(ticket)
    end

    it 'Saves picture to database' do
      login tenant
      post 'create', picture: attributes_for(:picture), ticket_id: ticket.id
      expect(assigns(:picture).persisted?).to be_truthy
    end
  end

  context 'GET #edit' do
      
    it "renders 'edit' view" do
      login tenant
      get :edit, id: picture.id
      expect(response).to render_template :edit
    end
  end


  context 'PUT #update' do
  
    it 'retrieves picture from db and instantiates it as @picture' do
      login tenant
      get :edit, id: picture.id
      expect(assigns(:picture)).to eq(picture)
    end 

     it 'redirects to ticket' do
      login tenant
      picture.ticket_id = ticket
      picture.save
      put 'update', ticket_id: ticket.id, id: picture.id, picture: attributes_for(:picture, caption: 'some text', image: Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/file.jpg", "image/jpg"))
      expect(response).to redirect_to ticket_path(ticket.id)
    end
  end


  context  "DELETE destroy " do

    it "deletes the picture and redirects to tickets#index" do 
      login tenant
      picture.ticket_id = ticket
      picture.save
      expect{ delete :destroy, ticket_id: ticket.id, id: picture.id }.to change(Picture,:count).by(-1) 
      expect(response).to redirect_to ticket_path(ticket.id)

    end 

end




end