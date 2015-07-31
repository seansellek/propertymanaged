module SpecLoginHelper
  def login_landlord
    landlord = create :landlord
    request.session[:user_id] = landlord.id
    request.session[:user_type] = 'landlord'
  end
  def login_tenant
    tenant = create :tenant
    request.session[:user_id] = tenant.id
    request.session[:user_type] = 'tenant'
  end
  def current_user
    if request.session[:user_type] == 'landlord'
      Landlord.find(request.session[:user_id])
    elsif request.session[:user_type] == 'tenant'
      Tenant.find(request.session[:user_id])
    else
      nil
    end
  end
end
