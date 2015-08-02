class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

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



  def require_logged_in
    return true if current_user 

    redirect_to login_path
    return false
  end
end
