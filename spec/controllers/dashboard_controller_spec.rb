require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  context 'GET /dashboard' do
    it 'redirects to landlord action' do
      login_landlord
      get 'show'

      expect(response).to redirect_to :action => :landlord
    end
    it 'redirects to tenant action' do
      login_tenant
      get 'show'

      expect(response).to redirect_to :action => :tenant
    end
    it 'redirects to login' do
      get 'show'

      expect(response).to redirect_to login_path
    end
  end

end
