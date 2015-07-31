require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  context 'GET /dashboard' do
    it 'displays landlord dashboard' do
      login_landlord
      get 'show'

      expect(response).to render_template "landlord"
    end
    it 'redirects to tenant action' do
      login_tenant
      get 'show'

      expect(response).to render_template "tenant"
    end
    it 'redirects to login' do
      get 'show'

      expect(response).to redirect_to login_path
    end
  end

end
