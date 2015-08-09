class InvitesController < ApplicationController
  before_action :require_logged_in
  include Monify
  before_action :monify_amount

  def new
    @invite = Invite.new
    @invite.property_id = params[:property_id]
    render layout: false
  end
  def create

    @invite = Invite.new(invite_params)
    @invite.landlord = Property.find(invite_params['property_id']).try(:landlord)
    if @invite.save
      if @invite.tenant != nil
        @tenant = @invite.tenant
        @occupancy = PropertyTenant.new(property: @invite.property, rate: @invite.amount, tenant: @tenant)
        
        if @occupancy.save
          InviteMailer.existing_tenant_invite(@invite).deliver_now
          flash[:notice] = 'Invite sent!'
        else 
          raise @invite.errors.full_messages
        end
      else
        InviteMailer.new_tenant_invite(@invite, new_tenant_url(:invite_token => @invite.token)).deliver_now
        flash[:notice] = 'Invite sent!'
      end
    else
      flash[:error] = 'Error sending invite'
    end
    redirect_to dashboard_path
  end

  private

  def invite_params
    params.
      require(:invite).
      permit(:email, :property_id, :amount)
  end
  def monify_amount
    if params[:invite] && params[:invite][:amount]
      params[:invite][:amount] = money_to_i(params[:invite][:amount])
    end
  end
end
