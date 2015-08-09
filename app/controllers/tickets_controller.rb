class TicketsController < ApplicationController
  before_action :require_logged_in
  before_action :require_tenant, only: [:new, :create, :update]
  before_action :require_owner, except: [:new, :create]

  
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
  end

  def update
    @ticket = Ticket.find(params['id'])
    @ticket.update_attributes(ticket_params)

    redirect_to dashboard_path
  end

 def close
    @ticket = Ticket.find(params['id'])
    @ticket.close
 end

 def show
    @ticket = Ticket.find(params['id'])
 end

  private
  #use strong parameters to protect from mass assignment
  def ticket_params
    params.require(:ticket).
      permit(:title, :description)
  end

  def require_owner
    @ticket = Ticket.find(params['id'])
    # byebug
    unless @ticket.property_tenant.send(current_user_type) == current_user
      flash[:error]="That's not your ticket!"
      redirect_to dashboard_path
      return
    end
  end

end
