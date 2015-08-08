require 'rails_helper'

RSpec.describe OccupancyPicturesController, type: :controller do
  let(:occupancy_picture) { create :occupancy_picture }
  let(:property_tenant) { occupancy_picture.property_tenant }
  let(:property) { create :property }
  let(:landlord) { property.landlord }
  
  context 'GET #new' do
    it 'Instantiates a new occupancy picture' do
      login landlord
      get 'new', property_tenant_id: property_tenant.id
      expect(assigns[:occupancy_picture]).to be_a(OccupancyPicture)
    end


    it "Renders 'new' view" do
      login landlord
       get 'new', property_tenant_id: property_tenant.id
      expect(response).to render_template(:new)
    end
  end

  context 'POST #create' do

    it 'Assigns @occupancy_picture to property_tenant' do
      login landlord
      post 'create',  occupancy_picture: attributes_for(:occupancy_picture), property_tenant_id: property_tenant.id,  id: occupancy_picture.id
      expect(assigns(:occupancy_picture).property_tenant).to eq(property_tenant)
    end

    it 'Saves occupancy_picture to database' do
      login landlord  
      post 'create', property_tenant_id: property_tenant.id, id: occupancy_picture.id, occupancy_picture: attributes_for(:occupancy_picture)
      expect(assigns(:occupancy_picture).persisted?).to be_truthy
    end
  end

  context 'GET #edit' do
      
    it "renders 'edit' view" do
      login landlord
      get :edit,  property_tenant_id: property_tenant.id, id: occupancy_picture.id
      expect(response).to render_template :edit
    end
  end


  context 'PUT #update' do
  
    it 'retrieves occupancy_picture from db and instantiates it as @occupancy_picture' do
      login landlord
      occupancy_picture.before = true
      occupancy_picture.save
      put :update, property_tenant_id: occupancy_picture.property_tenant.id, id: occupancy_picture.id, occupancy_picture: { caption: 'new caption' }
      expect(assigns(:occupancy_picture)).to eq(occupancy_picture)
    end 

     it 'redirects to Property' do
      login landlord
      occupancy_picture.property_tenant_id = property_tenant
      occupancy_picture.save
      put 'update', property_tenant_id: property_tenant.id, id: occupancy_picture.id, occupancy_picture: attributes_for(:occupancy_picture, caption: 'some text', image: Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/file.jpg", "image/jpg"))
      expect(response).to redirect_to property_path(property_tenant.id)
    end
  end


  context  "DELETE destroy " do

    it "deletes the occupancy_picture and redirects to property" do 
      login landlord
      occupancy_picture.property_tenant_id = property_tenant
      occupancy_picture.save
      expect{ delete :destroy, property_tenant_id: property_tenant.id, id: occupancy_picture.id }.to change(OccupancyPicture,:count).by(-1) 
      expect(response).to redirect_to property_path(property_tenant.id)

    end 

end




end