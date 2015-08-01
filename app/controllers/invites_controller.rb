class InvitesController < ApplicationController
  before_action :require_logged_in

  def new
    @invite = Invite.new
    @invite.property_id = params[:property_id]
  end
  def create
    # byebug
    @invite = Invite.new(invite_params)
    @invite.landlord_id = Property.find(invite_params['property_id']).try(:landlord_id)

    if @invite.save
      redirect_to dashboard_path
      # InviteMailer.new_tenant_invite(@invite, new_tenant_path(:invite_token => @invite.token)).deliver
    else
      #handle errors
    end
  end

  private

  def invite_params
    params.
      require(:invite).
      permit(:email, :property_id)
  end
end
