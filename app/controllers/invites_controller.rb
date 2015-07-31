class InvitesController < ApplicationController
  def new
    @invite = Invite.new(property_id: params[:property_id])
  end
  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id

    if @invite.save
      InviteMailer.new_tenant_invite(@invite, new_tenant_path(:invite_token => @invite.token)).deliver
    else
      #handle errors
    end
  end
end
