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

  def edit
    @ticket = Ticket.find(params['id'])
    # byebug
    redirect_to dashboard_path unless @ticket.property_tenant.tenant == current_user
  end

  def update
    @ticket = Ticket.find(params['id'])
    @ticket.update_attributes(ticket_params)

    redirect_to dashboard_path
  end


  private
  #use strong parameters to protect from mass assignment
  def ticket_params
    params.require(:ticket).
      permit(:title, :description)
  end

end
