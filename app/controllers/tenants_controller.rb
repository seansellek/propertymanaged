class TenantsController < ApplicationController
  def new 
    @token = params[:invite_token]
    @invite = Invite.find_by(token: @token)
    @tenant = Tenant.new
    render :noinvite unless @invite
  end
  def create
    @token = params[:tenant][:token]
    @invite = Invite.find_by(token: @token)
    unless @invite
      render :noinvite 
      return
    end
    @tenant = Tenant.new(tenant_params)
    unless @tenant.save
      flash[:error] = @tenant.errors.full_messages
      render :new
      return
    end
    @propertytenant= PropertyTenant.new
    @propertytenant.tenant = @tenant
    @propertytenant.property = @invite.property
    @propertytenant.rate = @invite.amount
    @propertytenant.save
    @invite.destroy
    set_current_user @tenant
    redirect_to dashboard_path
  end

  private

  def tenant_params
    # byebug
    params.require(:tenant)
      .permit(:name, :email, :password, :password_confirmation)
  end
end
