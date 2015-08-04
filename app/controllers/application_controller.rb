class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :require_tenant, :require_landlord

  def current_user
    if session[:user_type] == 'landlord'
      @current_user ||= Landlord.find(session[:user_id])
    elsif session[:user_type] == 'tenant'
      @current_user ||= Tenant.find(session[:user_id])
    end
  end

  def set_current_user user
    if user.class.to_s == 'Landlord'
      session[:user_type] = 'landlord'
      session[:user_id] = user.id
    elsif user.class.to_s == 'Tenant'
      session[:user_type] = 'tenant'
      session[:user_id] = user.id
    end
  end
  def require_tenant
    unless session[:user_type] == 'tenant'
      flash[:error] = "You have to be a tenant to do that!"
      redirect_to dashboard_path 
    end
  end

  def require_landlord
    redirect_to dashboard_path unless session[:user_type] == 'landlord'
  end

  def current_user_type
    session[:user_type].to_sym
  end

  def require_logged_in
    return true if current_user 

    redirect_to login_path
    return false
  end
end
