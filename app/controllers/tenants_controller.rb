class TenantsController < ApplicationController
  def new 
    @token = params[:invite_token]
    @tenant = Tenant.new
    render :noinvite unless @token
  end
end
