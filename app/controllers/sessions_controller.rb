class SessionsController < ApplicationController
  def new
  end

  def create
    if params['user_type'] == 'landlord'
      @user = Landlord.find_by(email: params['email']).try(:authenticate, params['password'])
    elsif params['user_type'] == 'tenant'
      @user = Tenant.find_by(email: params['email']).try(:authenticate, params['password'])
    end
  
    if @user
      session[:user_id] = @user.id
      session[:user_type] = params['user_type']
      redirect_to dashboard_path
      return
    end
    flash[:error] = 'Incorrect Credentials'
    render 'new'
  end

  def destroy
    session[:user_id] = nil
    session[:user_type] = nil
    redirect_to root_path
  end


end
