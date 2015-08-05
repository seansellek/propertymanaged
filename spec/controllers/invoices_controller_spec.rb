require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do
  let(:occupancy) { create :property_tenant }
  let(:landlord) { occupancy.landlord }
  let(:invoice)  { occupancy.invoice }
  before(:each) do
    login landlord
  end
  describe "GET #show" do
    it "returns http success" do
      get :show, id: invoice.id
      expect(assigns[:invoice]).to eq(invoice)
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
