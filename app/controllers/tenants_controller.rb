class TenantsController < ApplicationController
  def new 
    @token = params[:invite_token]
    @invite = Invite.find_by(token: @token)
    @tenant = Tenant.new
    render :noinvite unless @invite
  end
end
