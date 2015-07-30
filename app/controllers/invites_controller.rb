class InvitesController < ApplicationController
  def new
    @invite = Invite.new(property_id: params[:property_id])
  end
end
