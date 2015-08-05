require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do
  let(:ocupancy) { create :property_tenant }
  let(:landlord) { ocupancy.landlord }
  before(:each) do
    login landlord
  end
  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
