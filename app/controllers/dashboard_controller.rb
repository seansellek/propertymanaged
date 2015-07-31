class DashboardController < ApplicationController
  before_action :require_logged_in

  def show
    if session[:user_type] == 'landlord'
      render 'landlord'
    elsif session[:user_type] == 'tenant'
      render 'tenant'
    end
  end

end
