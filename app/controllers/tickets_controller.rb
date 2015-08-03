class TicketsController < ApplicationController
  
  def index
  end

  def new
    @ticket = Ticket.new
  end

  def create
    #make sure we assign the property with the attributes the user entered.
    @ticket = current_user.property_tenant.new(ticket_params)

    if @ticket.save
      flash[:notice] = "The Ticket is successfully saved!"
      redirect_to dashboard_path
    else
      render :back
    end
  end


  private
  #use strong parameters to protect from mass assignment
  def ticket_params
    params.require(:property_tenant).
      permit(:title, :description, :status)
  end

end
