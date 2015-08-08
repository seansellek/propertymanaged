class InvitesController < ApplicationController
  before_action :require_logged_in

  def new
    @invite = Invite.new
    @invite.property_id = params[:property_id]
    render layout: false
  end
  def create
    @invite = Invite.new(invite_params)
    @invite.landlord = Property.find(invite_params['property_id']).try(:landlord)

    if @invite.save
      InviteMailer.new_tenant_invite(@invite, new_tenant_url(:invite_token => @invite.token)).deliver_now
      flash[:notice] = 'Invite sent!'
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
end
