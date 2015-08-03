class TicketsController < ApplicationController
  before_action :require_logged_in
  before_action :require_tenant, only: [:new, :create]

  
  def index
  end

  def new
    @ticket = Ticket.new  
  end

  def create
    @ticket = current_user.current_occupancy.tickets.new(ticket_params)
    if @ticket.save
      #TODO: create notification
      flash[:notice] = "The Ticket is successfully saved!"
      redirect_to dashboard_path
    else
      render :back
    end
  end

  


  private
  #use strong parameters to protect from mass assignment
  def ticket_params
    params.require(:ticket).
      permit(:title, :description)
  end

end
