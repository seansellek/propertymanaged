require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:landlord) { create :landlord }
  context 'POST /session/create' do
    # it 'redirects to Dashboard' do
    #  post 'create', attributes_for(:landlord, user_type: 'landlord')
    #  expect(response).to render_template 
    # end
    # it 'alerts you of incorrect credentials' do
    #  post 'create', attributes_for(:landlord, user_type: 'landlord', email: "bad@email.com")

    #  expect(response).to render_template(:new)
    #  expect(flash[:error]).to be_present
    # end
    it 'stores user id and type to session' do
      post 'create', attributes_for(:landlord, email: landlord.email, user_type: 'landlord')
      expect(session[:user_id]).to be == landlord.id
      expect(session[:user_type]).to be == 'landlord'
    end
  end

end
