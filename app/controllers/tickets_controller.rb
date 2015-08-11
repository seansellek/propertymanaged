class TicketsController < ApplicationController
  before_action :require_logged_in
  before_action :require_tenant, only: [:new, :create, :update]
  before_action :require_owner, except: [:new, :create, :index, :close]
  before_action :require_tenant_close, only: [:close]

  
  def index
    @tickets = current_user.tickets
  end

  def show
    
  end

  def new
    @ticket = Ticket.new
    @picture = Picture.new  
  end

  def create
    @ticket = current_user.current_occupancy.tickets.new(ticket_params)
    @ticket.picture_ids = params['picture_ids'].map(&:to_i)
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
    @ticket.save
    redirect_to dashboard_path
 end

 def show
    @ticket = Ticket.find(params['id'])
 end

  private
  #use strong parameters to protect from mass assignment
  def ticket_params
    params.require(:ticket).
      permit(:title, :description, :picture_ids)
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

  def require_tenant_close
    @ticket = Ticket.find(params['id'])
    unless @ticket.property_tenant.tenant == current_user
      flash[:error]="You can only close your own tickers"
      redirect_to dashboard_path
      return
    end
  end

end
